import SwiftUI
//import ARTNetwork
import NeugelbUIComponents

final class MovieListViewModel: ObservableObject {
    
//    private var repository: ARTRepository
    private var coordinator: MovieCoordinator?
//    
//    @MainActor @Published
//    var places : [PlacesListItem.Model] = []
//    
//    init(
//        repository : ARTRepository,
//        coordinator: PaintingCoordinator
//    ) {
//        self.repository = repository
//        self.coordinator = coordinator
//    }
//    
//    func getPlaces() async {
//        guard let allPlaces = try? await repository.fetchLocations() else { return }
//        Task { @MainActor in
//            print()
//            places = allPlaces.map({ getPlacesListItemModel(from: $0) })
//        }
//        
//    }
//    
//    func navigateBack() {
//        coordinator?.navigate(.back)
//    }
//
//    func goToPlace(id: String) {
//        coordinator?.navigate(.place(id))
//    }

}

// MARK: - Private Methods

private extension MovieListViewModel {
    
//    func getPlacesListItemModel(from place: Location) -> PlacesListItem.Model {
//        PlacesListItem.Model.Builder()
//            .with(id: place.id)
//            .with(name: place.name)
//            .with(address: "\(place.country), \(place.city)")
//            .with(imageUrl: place.image)
//            .with(imageService: DefaultImageService())
//            .with(detailButtonActionHandler: { [weak self] id in
//                self?.goToPlace(id: id)
//            })
//            .build()
//    }
}
