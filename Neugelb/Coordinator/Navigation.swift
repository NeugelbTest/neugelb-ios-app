import Foundation

protocol NavigationProtocol {}

enum Navigation: NavigationProtocol, Equatable {

    case main
    case onboard

}

// MARK: - Painting

extension Navigation {

    enum Movie: NavigationProtocol {

        case movie(Int)
        case movieList
        case back

    }

}
