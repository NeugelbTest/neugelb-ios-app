import UIKit
import NeugelbColors

/// `UINavigationController` subclass with hidden navigation bar and working swipe-to-pop gesture.
final class NeugelbNavigationController: UINavigationController {

    // MARK: - Properties

    private let shouldForceHideNavigationBar: Bool

    // MARK: - Initialization

    init(rootViewController: UIViewController, isNavigationBarHidden: Bool) {
        shouldForceHideNavigationBar = isNavigationBarHidden

        super.init(rootViewController: rootViewController)

        configureNavigationBar()
    }

    init(isNavigationBarHidden: Bool) {
        shouldForceHideNavigationBar = isNavigationBarHidden

        super.init(navigationBarClass: nil, toolbarClass: nil)

        configureNavigationBar()
    }

    deinit {
        #if Development
        print(Self.self, "was deinited")
        #endif
    }

    override init(rootViewController: UIViewController) {
        shouldForceHideNavigationBar = true

        super.init(rootViewController: rootViewController)

        configureNavigationBar()
        modalPresentationCapturesStatusBarAppearance = true
    }

    required init?(coder aDecoder: NSCoder) {
        shouldForceHideNavigationBar = true

        super.init(coder: aDecoder)

        configureNavigationBar()
    }

    // MARK: - Base Class

    override func viewDidLoad() {
        super.viewDidLoad()

        interactivePopGestureRecognizer?.delegate = self
        if #unavailable(iOS 16) {
            isNavigationBarHidden = shouldForceHideNavigationBar
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if #unavailable(iOS 16) {
            isNavigationBarHidden = shouldForceHideNavigationBar
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if #unavailable(iOS 16) {
            isNavigationBarHidden = shouldForceHideNavigationBar
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if #unavailable(iOS 16) {
            isNavigationBarHidden = shouldForceHideNavigationBar
        }
    }

}

// MARK: - Private Methods

private extension NeugelbNavigationController {

    func configureNavigationBar() {

        if shouldForceHideNavigationBar {
            isNavigationBarHidden = true
        } else {
            navigationBar.isTranslucent = false
            navigationBar.backgroundColor = ColorAsset.grey100.uiColor
            navigationBar.tintColor = ColorAsset.grey80.uiColor
        }
    }

}

// MARK: - UIGestureRecognizerDelegate

extension NeugelbNavigationController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        viewControllers.count > 1
    }

}

