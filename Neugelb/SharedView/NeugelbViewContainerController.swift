import SwiftUI

/// View controller that can be used as a container for SwiftUI views those needed to be used in the UIKit environment.
class NeugelbViewContainerController<Content: View>: NeugelbViewController {

    // MARK: - Typealiases

    typealias RootViewMaker = () -> Content

    // MARK: - Properties

    var hostingControllerShouldIgnoreSafeArea: Bool { false }
    var hostingControllerViewBackgroundColor: UIColor { .clear }

    private let rootViewMaker: RootViewMaker

    private(set) lazy var rootView = rootViewMaker()
    private(set) lazy var hostingController = NeugelbHostingController(rootView: rootView, ignoreSafeArea: hostingControllerShouldIgnoreSafeArea)

    // MARK: - Initialization

    init(rootViewMaker: @escaping RootViewMaker) {
        self.rootViewMaker = rootViewMaker
        super.init()
    }

    // MARK: - Base Class

    override func loadView() {
        super.loadView()

        addHostingView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        isModalInPresentation = true
        hostingController.view.backgroundColor = hostingControllerViewBackgroundColor
    }

    override func setup() {
        navigationItem.backButtonDisplayMode = .minimal
    }

    // MARK: - Public Methods

    func addHostingView() {
        addHostingToParent()
        hostingController.view.add(to: view) {
            $0.leadingAnchor.constraint(equalTo: $1.leadingSafeAnchor)
            $0.topAnchor.constraint(equalTo: $1.topSafeAnchor)
            $1.trailingSafeAnchor.constraint(equalTo: $0.trailingAnchor)
            $1.bottomAnchor.constraint(equalTo: $0.bottomAnchor)
        }
    }

    func addHostingToParent() {
        addChild(hostingController)
        hostingController.didMove(toParent: self)
    }

}
