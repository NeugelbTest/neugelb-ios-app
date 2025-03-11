import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    
    @MainActor
    func start()
}

extension Coordinator {
    
    @MainActor
    var topController: UIViewController { get async {
        await topViewController(controller: navigationController)
    }}
    
    
    @MainActor
    func topViewController(controller: UIViewController) async -> UIViewController {
        if let navigationController = controller as? UINavigationController {
            if let visibleViewController = navigationController.visibleViewController, visibleViewController.isSuitableForTop {
                return await topViewController(controller: visibleViewController)
            }
            if let lastSuitableController = navigationController.viewControllers.last(where: { $0.isSuitableForTop }) {
                return await topViewController(controller: lastSuitableController)
            }
            return await topViewController(controller: navigationController)
        }
        if let selectedTabBarController = (controller as? UITabBarController)?.selectedViewController {
            return await topViewController(controller: selectedTabBarController)
        }
        return controller
    }
    
}


// MARK: - UIViewController Extension

private extension UIViewController {

    var isSuitableForTop: Bool {
        !isBeingDismissed && !isBeingPresented
    }

}
