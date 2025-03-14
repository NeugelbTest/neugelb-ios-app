import UIKit

extension UIView {

    typealias ConstraintsMaker = (_ view: UIView, _ superView: UIView) -> [NSLayoutConstraint]
    /// Adds view as subview to given view, sets `translatesAutoresizingMaskIntoConstraints` to `false` and activates constraints returned in `constraintsMaker` closure.
    /// - Parameters:
    ///   - view: View we're adding to.
    ///   - constraints: The first argument is a view we're adding to. The second arguments is a view's superview. Returns an array of constraints that will be activated in superview.
    func add(to view: UIView, @ConstraintsBuilder constraintsMaker: ConstraintsMaker) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraintsMaker(self, view))
    }

    @resultBuilder
    // swiftlint:disable:next convenience_type
    struct ConstraintsBuilder {

        static func buildBlock(_ content: NSLayoutConstraint...) -> [NSLayoutConstraint] { content }
        static func buildIf(_ content: NSLayoutConstraint?) -> NSLayoutConstraint? { content }
        static func buildEither(first: NSLayoutConstraint) -> NSLayoutConstraint { first }
        static func buildEither(second: NSLayoutConstraint) -> NSLayoutConstraint { second }

    }
}

// MARK: - Safe Area Anchors

public extension UIView {

    /// `safeAreaLayoutGuide`s leading anchor.
    var leadingSafeAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.leadingAnchor
    }

    /// `safeAreaLayoutGuide`s trailing anchor.
    var trailingSafeAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.trailingAnchor
    }

    /// `safeAreaLayoutGuide`s bottom anchor.
    var bottomSafeAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.bottomAnchor
    }

    /// `safeAreaLayoutGuide`s top anchor.
    var topSafeAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.topAnchor
    }

    /// `safeAreaLayoutGuide`s center `y` anchor.
    var centerYSafeAnchor: NSLayoutYAxisAnchor {
        safeAreaLayoutGuide.centerYAnchor
    }

    /// `safeAreaLayoutGuide`s center `x` anchor.
    var centerXSafeAnchor: NSLayoutXAxisAnchor {
        safeAreaLayoutGuide.centerXAnchor
    }

}
