import UIKit

class NeugelbViewController: UIViewController {

    // MARK: - Properties

    var viewBackgroundColor: UIColor { .clear }
//
//    let cancellable = CancellableBag()

    // MARK: - Initialization

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print(Self.self, "was deinited")
    }

    // MARK: - Base Class

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = viewBackgroundColor
        setup()
    }

    // MARK: - Public Methods

    /// Override this method to perform any setup during `viewDidLoad` stage, e.g add subviews.
    /// You must not call this method directly.
    func setup() {}

}
