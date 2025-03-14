import SwiftUI
import NeugelbFonts
import NeugelbColors
import NeugelbUIComponents

struct MovieView: View {
    
    @ObservedObject var viewModel: MovieViewModel
    
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
