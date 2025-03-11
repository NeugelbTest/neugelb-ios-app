import Foundation

protocol NavigationProtocol {}

enum Navigation: NavigationProtocol, Equatable {

    case main
    case onboard

}

// MARK: - Painting

extension Navigation {

    enum Movie: NavigationProtocol {

        case movie(String)
        case movieList
        case back

    }

}
