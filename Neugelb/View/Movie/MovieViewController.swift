import UIKit
import SwiftUI
import NeugelbColors

class MovieViewController: NeugelbViewContainerController<MovieView> {
    
    override var viewBackgroundColor: UIColor {
        ColorAsset.grey80.uiColor
    }
    
    private let viewModel: MovieViewModel
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        super.init {
            MovieView(viewModel: viewModel)
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()

        Task {
            //await viewModel.getPlaces()
        }
    }
}
