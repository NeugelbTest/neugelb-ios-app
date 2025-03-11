import SwiftUI
import NeugelbFonts
import NeugelbColors
import NeugelbUIComponents

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        
//        ARTNavigationScrollView(
//            title: "Places",
//            backgroundColor: .clear,
//            backButtonStyle: .back,
//            backButtonAction: {
//                viewModel.navigateBack()
//            }
//        ) {
//            content
//        }
        
        Text("Hello, World!")
    }
    
//    var content: some View {
//        ScrollView {
//            ForEach(viewModel.places) { place in
//                PlacesListItem(model: place)
//                    .fillWidth()
//            }
//            .padding(.horizontal, 16)
//        }
//    }
}
