import Combine
import UIKit

protocol MovieCoordinator: Coordinator {

    var rootViewController: UIViewController { get set }
    func navigate(_ route: Navigation.Movie)

}
