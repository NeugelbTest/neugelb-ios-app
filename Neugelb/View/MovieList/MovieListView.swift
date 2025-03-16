import SwiftUI
import NeugelbFonts
import NeugelbColors
import NeugelbUIComponents
import NeugelbLocalized

struct MovieListView: View {

    @ObservedObject var viewModel: MovieListViewModel

    var body: some View {
        switch viewModel.movies {
        case .success(let movies):
            NeugelbNavigationListView(
                title: Localizable.latestMovies,
                subtitle: Localizable.latestMoviesDescription,
                backgroundColor: .clear
            ) {
                content(movies: movies)
            }
        case .loading:
            NeugelbNavigationScrollView(
                title: Localizable.movieInformation,
                subtitle: Localizable.latestMoviesDescription,
                backgroundColor: .clear
            ) {
                NeugelbLoadingView()
            }
        case .failed:
            NeugelbNavigationScrollView(
                title: Localizable.movieInformation,
                subtitle: Localizable.latestMoviesDescription,
                backgroundColor: .clear
            ) {
                NeugelbErrorView(error: Localizable.errorMessage)
            }
        }

    }

    func content(movies: [MovieListItem.Model]) -> some View {
        ForEach(movies) { movie in
            MovieListItem(model: movie)
                .padding(.horizontal, .spacing16)
                .padding(.bottom, .spacing16)
                .onAppear {
                    if movie.id == movies.last?.id {
                        Task { await viewModel.getMovies() }
                    }
                }
        }
    }

}
