import Combine
import UIKit

protocol MovieCoordinator: Coordinator {
    
    var rootViewController: UIViewController { set get }
    func navigate(_ route: Navigation.Movie)

}
