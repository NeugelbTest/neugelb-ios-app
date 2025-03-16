import SwiftUI
import NeugelbNetwork
import NeugelbUIComponents

final class MovieListViewModel: ObservableObject {

    private var service: MovieService
    private var coordinator: MovieCoordinator?
    private var currentPage = 1
    private var isLoading = false

    @MainActor @Published
    var movies: NeugelbViewStatus<[MovieListItem.Model]> = .loading

    @MainActor @Published
    private(set) var hasMore: Bool = true
    
    private var currentMovies: [MovieListItem.Model] = []

    init(
        service: MovieService,
        coordinator: MovieCoordinator
    ) {
        self.service = service
        self.coordinator = coordinator
    }

    func getMovies() async {
        guard await hasMore, !isLoading else { return }
        isLoading = true
        defer { isLoading = false }

        guard let movies = try? await service.fetchMovies(by: currentPage), !movies.isEmpty else {
            Task { @MainActor in self.hasMore = false }
            return
        }

        Task { @MainActor in
            self.currentMovies.append(contentsOf: movies.map({ getMovieListItemModel(from: $0) }))
            self.movies = .success(currentMovies)
            self.currentPage += 1
        }
    }

    func goToMovie(id: Int) {
        coordinator?.navigate(.movie(id))
    }

}

// MARK: - Private Methods

private extension MovieListViewModel {

    func getMovieListItemModel(from movie: Movie) -> MovieListItem.Model {
        MovieListItem.Model.Builder()
            .with(id: movie.id)
            .with(title: movie.title)
            .with(imageUrl: movie.poster)
            .with(rate: movie.rating)
            .with(overview: movie.overview)
            .with(releaseDate: movie.releaseDate)
            .with(language: movie.language)
            .with(imageService: NeugelbNetwork.imageService)
            .with(detailButtonActionHandler: { [weak self] id in
                self?.goToMovie(id: id)
            })
            .build()
    }
}
