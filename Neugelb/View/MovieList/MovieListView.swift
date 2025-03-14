import SwiftUI
import NeugelbFonts
import NeugelbColors
import NeugelbUIComponents
import NeugelbLocalized

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        
        NeugelbNavigationListView(
            title: Localizable.latestMovies,
            subtitle: Localizable.latestMoviesDescription,
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
