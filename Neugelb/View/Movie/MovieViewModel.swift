import SwiftUI
import NeugelbNetwork
import NeugelbUIComponents

final class MovieViewModel: ObservableObject {

    private var service: MovieService
    private var coordinator: MovieCoordinator?
    private var imageService: ImageService

    @MainActor @Published
    var movie: NeugelbViewStatus<Movie> = .loading

    @MainActor @Published
    var cover: ImageStatus = .loading

    @MainActor @Published
    var poster: ImageStatus = .loading

    init(
        service: MovieService,
        coordinator: MovieCoordinator,
        imageService: ImageService = NeugelbNetwork.imageService
    ) {
        self.service = service
        self.coordinator = coordinator
        self.imageService = imageService
    }

    func getMovie(id: Int) async {
        guard let movie = try? await service.fetchMovieDetails(for: id) else { return }
        Task { @MainActor in
            self.movie = .success(movie)
            poster = await fetchImage(image: movie.poster)
            cover = await fetchImage(image: movie.cover)
        }
    }

    func navigateBack() {
        coordinator?.navigate(.back)
    }
}

// MARK: - Private Methods

private extension MovieViewModel {

    func fetchImage(image: String?) async -> ImageStatus {
        guard let path = image else {
            return .failed
        }
        do {
            guard let image = try await imageService.fetchImage(from: path) else {
                return .failed
            }
            return .success(image)
        } catch {
            return .failed
        }
    }
}
