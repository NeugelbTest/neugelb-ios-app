import SwiftUI
import NeugelbFonts
import NeugelbColors
import NeugelbUIComponents
import NeugelbNetwork
import NeugelbLocalized

struct MovieView: View {

    @ObservedObject var viewModel: MovieViewModel

    var body: some View {
        switch viewModel.movie {
        case .success(let movie):
            NeugelbNavigationScrollView(
                title: Localizable.movieInformation,
                backgroundColor: .clear,
                backButtonStyle: .back,
                backButtonAction: {
                    viewModel.navigateBack()
                }
            ) {
                content(movie: movie)
            }
        case .loading:
            NeugelbNavigationScrollView(
                title: Localizable.movieInformation,
                backgroundColor: .clear,
                backButtonStyle: .back,
                backButtonAction: {
                    viewModel.navigateBack()
                }
            ) {
                NeugelbLoadingView()
            }
        case .failed:
            NeugelbNavigationScrollView(
                title: Localizable.movieInformation,
                backgroundColor: .clear,
                backButtonStyle: .back,
                backButtonAction: {
                    viewModel.navigateBack()
                }
            ) {
                NeugelbErrorView(error: Localizable.errorMessage)
            }
        }
    }

    func content(movie: Movie) -> some View {
        VStack {
            header(movie: movie)
            quickInformation(movie: movie)
            overview(movie: movie)
            status(movie: movie)
            rating(movie: movie)
            releaseDate(movie: movie)
            language(movie: movie)
            runtime(movie: movie)
            budget(movie: movie)
            revenue(movie: movie)
            adult(movie: movie)
        }

    }

    func header(movie: Movie) -> some View {
        NeugelbImageView(image: $viewModel.cover)
            .fillWidth()
            .frame(height: Constant.headerHeight)
            .clipped()
            .padding(.bottom, .spacing56)
            .overlay(
                HStack(alignment: .bottom, spacing: .spacing16) {
                    NeugelbImageView(image: $viewModel.poster)
                        .frame(
                            width: Constant.imageWidth,
                            height: Constant.imageHeight
                        )
                        .clipped()
                        .cornerRadius(16)

                    NeugelbText(
                        text: movie.title,
                        weight: .semibold,
                        size: 20,
                        textColor: .grey10
                    )
                    .padding(.bottom, .spacing4)

                    Spacer()
                }
                .padding(.horizontal, .spacing16),
                alignment: .bottom
            )
    }

    func overview(movie: Movie) -> some View {
        NeugelbText(
            text: movie.overview,
            weight: .regular,
            size: 14,
            textColor: .grey20,
            alignment: .leading
        )
        .padding(.horizontal, .spacing16)
        .padding(.top, .spacing16)
    }

    func quickInformation(movie: Movie) -> some View {
        HStack(spacing: .spacing8) {
            NeugelbQuickInfo(
                model: .star,
                value: "\(movie.rating ?? 0)"
            )
            Divider()
                .frame(width: 1)
                .overlay(.gray)
            NeugelbQuickInfo(
                model: .calendar,
                value: movie.releaseDate.formattedString()
            )
            Divider()
                .frame(width: 1)
                .overlay(.gray)
            NeugelbQuickInfo(
                model: .ticket,
                value: movie.language ?? ""
            )
        }
        .padding(.top, .spacing16)
        .padding(.bottom, .spacing8)

    }

    @ViewBuilder
    func status(movie: Movie) -> some View {
        if let status = movie.status {
            NeugelbInfoRow(title: Localizable.status, value: "\(status)")
        }
    }

    @ViewBuilder
    func rating(movie: Movie) -> some View {
        if let rating = movie.rating {
            NeugelbInfoRow(title: Localizable.rating, value: "\(rating)")
        }
    }

    @ViewBuilder
    func releaseDate(movie: Movie) -> some View {
        NeugelbInfoRow(title: Localizable.release, value: "\(movie.releaseDate)")
    }

    @ViewBuilder
    func language(movie: Movie) -> some View {
        if let language = movie.language {
            NeugelbInfoRow(title: Localizable.language, value: language)
        }
    }

    @ViewBuilder
    func runtime(movie: Movie) -> some View {
        if let runtime = movie.runtime {
            NeugelbInfoRow(title: Localizable.runtime, value: "\(runtime)")
        }
    }

    @ViewBuilder
    func budget(movie: Movie) -> some View {
        if let budget = movie.budget {
            NeugelbInfoRow(title: Localizable.budget, value: "\(budget)")
        }
    }

    @ViewBuilder
    func revenue(movie: Movie) -> some View {
        if let revenue = movie.revenue {
            NeugelbInfoRow(title: Localizable.revenue, value: "\(revenue)")
        }
    }

    @ViewBuilder
    func adult(movie: Movie) -> some View {
        if let adult = movie.adult {
            NeugelbInfoRow(title: Localizable.adult, value: adult ? Localizable.yes : Localizable.no)
        }
    }

}

// MARK: - Constants

private extension MovieView {

    enum Constant {

        static let imageWidth: CGFloat = 96
        static let imageHeight: CGFloat = 120
        static let headerHeight: CGFloat = 200
    }

}
