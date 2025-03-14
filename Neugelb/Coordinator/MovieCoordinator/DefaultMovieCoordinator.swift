import UIKit
import NeugelbNetwork

class DefaultMovieCoordinator: Coordinator {

    var rootViewController: UIViewController
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.rootViewController = UIViewController()
    }

    @MainActor
    func start() {
        navigate(.movieList)
    }
}

extension DefaultMovieCoordinator: MovieCoordinator {

    func navigate(_ route: Navigation.Movie) {
        Task { @MainActor in
            switch route {
            case .back:
                navigationController.popViewController(animated: true)
            case .movieList:
                await navigateToMovieList()
            case .movie(let id):
                await navigateToMovie(for: id)

            }
        }
    }
}

// MARK: - Private Methods

private extension DefaultMovieCoordinator {

    @MainActor
    func navigateToMovieList() async {
        let viewModel = MovieListViewModel(service: NeugelbNetwork.movieService, coordinator: self)
        let viewContoller = MovieListViewController(viewModel: viewModel)
        self.navigationController.pushViewController(viewContoller, animated: true)
    }

    @MainActor
    func navigateToMovie(for id: Int) async {
        let viewModel = MovieViewModel(service: NeugelbNetwork.movieService, coordinator: self)
        let viewController = MovieViewController(movieId: id, viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }

}
