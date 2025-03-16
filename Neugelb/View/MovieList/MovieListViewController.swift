import UIKit
import SwiftUI
import NeugelbColors

class MovieListViewController: NeugelbViewContainerController<MovieListView> {

    override var viewBackgroundColor: UIColor {
        ColorAsset.grey90.uiColor
    }

    private let viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init {
            MovieListView(viewModel: viewModel)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await viewModel.getMovies()
        }
    }
}
