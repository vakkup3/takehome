import UIKit

// MARK: - Superview

extension UIView {
    func pin(with insets: UIEdgeInsets = .zero, safeArea: Bool = false) {
        guard let superview = self.superview else { fatalError("invalid superview") }

        pin(to: superview, with: insets, safeArea: safeArea)
    }

    @discardableResult
    func pinTop(with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError("invalid superview") }

        return pinTop(to: superview, with: inset, safeArea: safeArea)
    }

    @discardableResult
    func pinLeft(with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError("invalid superview") }

        return pinLeft(to: superview, with: inset, safeArea: safeArea)
    }

    @discardableResult
    func pinBottom(with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError("invalid superview") }

        return pinBottom(to: superview, with: inset, safeArea: safeArea)
    }

    @discardableResult
    func pinRight(with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError("invalid superview") }

        return pinRight(to: superview, with: inset, safeArea: safeArea)
    }

    @discardableResult
    func centerVertically(with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError("invalid superview") }

        return centerVertically(to: superview, with: inset, safeArea: safeArea)
    }

    @discardableResult
    func centerHorizontally(with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        guard let superview = self.superview else { fatalError("invalid superview") }

        return centerHorizontally(to: superview, with: inset, safeArea: safeArea)
    }
}

// MARK: - Custom

extension UIView {
    func pin(to view: UIView, with insets: UIEdgeInsets = .zero, safeArea: Bool = false) {
        pinTop(to: view, with: insets.top, safeArea: safeArea)
        pinLeft(to: view, with: insets.left, safeArea: safeArea)
        pinBottom(to: view, with: insets.bottom, safeArea: safeArea)
        pinRight(to: view, with: insets.right, safeArea: safeArea)
    }

    @discardableResult
    func pinTop(to view: UIView, with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        topConstraint?.isActive = false

        let constraint = topAnchor.constraint(equalTo: safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor)

        constraint.constant = inset
        constraint.isActive = true

        return constraint
    }

    @discardableResult
    func pinLeft(to view: UIView, with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        leftConstraint?.isActive = false

        let constraint = leftAnchor.constraint(equalTo: safeArea ? view.safeAreaLayoutGuide.leftAnchor : view.leftAnchor)

        constraint.constant = inset
        constraint.isActive = true

        return constraint
    }

    @discardableResult
    func pinBottom(to view: UIView, with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        bottomConstraint?.isActive = false

        let constraint = (safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor).constraint(equalTo: bottomAnchor)

        constraint.constant = inset
        constraint.isActive = true

        return constraint
    }

    @discardableResult
    func pinRight(to view: UIView, with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        rightConstraint?.isActive = false

        let constraint = (safeArea ? view.safeAreaLayoutGuide.rightAnchor : view.rightAnchor).constraint(equalTo: rightAnchor)

        constraint.constant = inset
        constraint.isActive = true

        return constraint
    }

    @discardableResult
    func centerVertically(to view: UIView, with inset: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        centerYConstraint?.isActive = false

        let constraint = (safeArea ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor).constraint(equalTo: centerYAnchor)

        constraint.constant = inset
        constraint.isActive = true

        return constraint
    }

    @discardableResult
    func centerHorizontally(to view: UIView, with _: CGFloat = 0.0, safeArea: Bool = false) -> NSLayoutConstraint {
        centerXConstraint?.isActive = false

        let constraint = (safeArea ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor).constraint(equalTo: centerXAnchor)
        constraint.isActive = true

        return constraint
    }
}

// MARK: - Sizing

extension UIView {
    @discardableResult
    func pinWidth(to value: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = widthConstraint ?? widthAnchor.constraint(equalToConstant: value)

        constraint.constant = value
        constraint.isActive = true

        return constraint
    }

    @discardableResult
    func pinHeight(to value: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = heigthConstraint ?? heightAnchor.constraint(equalToConstant: value)

        constraint.constant = value
        constraint.isActive = true

        return constraint
    }

    func pinSize(to size: CGSize) {
        pinWidth(to: size.width)
        pinHeight(to: size.height)
    }

    @discardableResult
    func pinAspectRatio(to value: CGFloat = 0.0) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalTo: widthAnchor, multiplier: value)
        constraint.isActive = true

        return constraint
    }
}

// MARK: - Constraints

extension UIView {
    var topConstraint: NSLayoutConstraint? {
        constraint(for: topAnchor)
    }

    var leftConstraint: NSLayoutConstraint? {
        constraint(for: leftAnchor)
    }

    var bottomConstraint: NSLayoutConstraint? {
        constraint(for: bottomAnchor)
    }

    var rightConstraint: NSLayoutConstraint? {
        constraint(for: rightAnchor)
    }

    var centerXConstraint: NSLayoutConstraint? {
        constraint(for: centerXAnchor)
    }

    var centerYConstraint: NSLayoutConstraint? {
        constraint(for: centerYAnchor)
    }

    var widthConstraint: NSLayoutConstraint? {
        constraint(for: widthAnchor)
    }

    var heigthConstraint: NSLayoutConstraint? {
        constraint(for: heightAnchor)
    }
}

// MARK: - Private

private extension UIView {
    func constraint(for anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }

        return superview.constraints.first {
            if let firstView = $0.firstItem as? UIView, firstView == self, $0.firstAnchor == anchor, $0.relation == .equal {
                return true
            }

            if let secondView = $0.secondItem as? UIView, secondView == self, $0.secondAnchor == anchor, $0.relation == .equal {
                return true
            }

            return false
        }
    }

    func constraint(for anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint? {
        guard let superview = superview else { return nil }

        return superview.constraints.first {
            if let firstView = $0.firstItem as? UIView, firstView == self, $0.firstAnchor == anchor, $0.relation == .equal {
                return true
            }

            if let secondView = $0.secondItem as? UIView, secondView == self, $0.secondAnchor == anchor, $0.relation == .equal {
                return true
            }

            return false
        }
    }

    func constraint(for anchor: NSLayoutAnchor<NSLayoutDimension>) -> NSLayoutConstraint? {
        constraints.first {
            if let firstView = $0.firstItem as? UIView, firstView == self, $0.firstAnchor == anchor, $0.relation == .equal {
                return true
            }

            if let secondView = $0.secondItem as? UIView, secondView == self, $0.secondAnchor == anchor, $0.relation == .equal {
                return true
            }

            return false
        }
    }
}
