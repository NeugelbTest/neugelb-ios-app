import SwiftUI
import NeugelbNetwork
import NeugelbUIComponents

final class MovieListViewModel: ObservableObject {

    private var service: MovieService
    private var coordinator: MovieCoordinator?

    @MainActor @Published
    var movies: [MovieListItem.Model] = []

    init(
        service: MovieService,
        coordinator: MovieCoordinator
    ) {
        self.service = service
        self.coordinator = coordinator
    }

    func getMovies() async {
        guard let movies = try? await service.fetchMovies(by: 1) else { return }
        Task { @MainActor in
            self.movies = movies.map({ getMovieListItemModel(from: $0) })
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
