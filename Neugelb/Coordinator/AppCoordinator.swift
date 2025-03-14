import SwiftUI
import UIKit
import Combine

class AppCoordinator: Coordinator {

    let window: UIWindow

    var childCoordinators: [Coordinator] = []

    let hasSeenOnboarding = CurrentValueSubject<Bool, Never>(false)
    private var subscription = Set<AnyCancellable>()

    var navigationController = NeugelbNavigationController(isNavigationBarHidden: true) as UINavigationController

    init(window: UIWindow) {
        self.window = window
    }

    @MainActor
    func start() {
        gotToMovieList()
    }
}

private extension AppCoordinator {

    @MainActor
    private func gotToMovieList() {
        let movieCoordinator = DefaultMovieCoordinator(navigationController: navigationController)
        movieCoordinator.start()
        self.childCoordinators = [movieCoordinator]
        window.rootViewController = movieCoordinator.navigationController
    }
}
