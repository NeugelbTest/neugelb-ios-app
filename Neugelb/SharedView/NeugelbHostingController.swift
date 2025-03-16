import SwiftUI

class NeugelbHostingController<Content>: UIHostingController<Content> where Content: View {

    var onIntrinsicContentHeightChange: EmptyHandler?

    private var previousIntrinsicHeight: CGFloat?

    // MARK: - Initialization

    convenience init(rootView: Content, ignoreSafeArea: Bool) {
        self.init(rootView: rootView)

        if ignoreSafeArea {
            disableSafeArea()
        }
    }

    deinit {
        #if Development
        print(Self.self, "was deinited")
        #endif
    }

    // MARK: - Base Class

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.view.invalidateIntrinsicContentSize()

        guard let onIntrinsicContentHeightChange else { return }
        let intrinsicContentHeight = view.intrinsicContentSize.height
        if previousIntrinsicHeight != intrinsicContentHeight {
            onIntrinsicContentHeightChange()
        }
        previousIntrinsicHeight = intrinsicContentHeight
    }

}

// MARK: - Private Methods

private extension NeugelbHostingController {

    /// Hack that fixes issue with safe area in `UIHostingController`.
    ///
    /// https://defagos.github.io/swiftui_collection_part3/#fixing-cell-frames
    /// https://stackoverflow.com/questions/70032739/why-does-swiftui-uihostingcontroller-have-extra-spacing
    func disableSafeArea() {
        guard let viewClass = object_getClass(view) else { return }

        let viewSubclassName = String(cString: class_getName(viewClass)).appending("_IgnoreSafeArea")
        if let viewSubclass = NSClassFromString(viewSubclassName) {
            object_setClass(view, viewSubclass)
        } else {
            guard let viewClassNameUtf8 = (viewSubclassName as NSString).utf8String else { return }
            guard let viewSubclass = objc_allocateClassPair(viewClass, viewClassNameUtf8, 0) else { return }

            if let method = class_getInstanceMethod(UIView.self, #selector(getter: UIView.safeAreaInsets)) {
                let safeAreaInsets: @convention(block) (AnyObject) -> UIEdgeInsets = { _ in
                    return .zero
                }
                class_addMethod(viewSubclass, #selector(getter: UIView.safeAreaInsets), imp_implementationWithBlock(safeAreaInsets), method_getTypeEncoding(method))
            }

            objc_registerClassPair(viewSubclass)
            object_setClass(view, viewSubclass)
        }
    }

}
