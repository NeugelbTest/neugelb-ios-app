import UIKit
import SwiftUI
import NeugelbColors

class MovieViewController: NeugelbViewContainerController<MovieView> {

    override var viewBackgroundColor: UIColor {
        ColorAsset.grey90.uiColor
    }

    private let viewModel: MovieViewModel
    private let movieId: Int

    init(movieId: Int, viewModel: MovieViewModel) {
        self.viewModel = viewModel
        self.movieId = movieId
        super.init {
            MovieView(viewModel: viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await viewModel.getMovie(id: movieId)
        }
    }
}
