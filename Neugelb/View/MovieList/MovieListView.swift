import SwiftUI
import NeugelbFonts
import NeugelbColors
import NeugelbUIComponents

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        
        NeugelbNavigationListView(
            title: "Latest Movies",
            subtitle: "The latest movies sort by favorites",
            backgroundColor: .clear
        ) {
            content
        }
    }
    
    var content: some View {
        ForEach(viewModel.movies) { movie in
            MovieListItem(model: movie)
                .padding(.horizontal, .spacing16)
                .padding(.bottom, .spacing16)
        }

    }

}
