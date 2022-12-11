import UIKit

protocol CellAnyConfig {
    static var cellAnyType: UIView.Type { get }
    var identifier: String { get }

    func setupAny(cell: UIView, at indexPath: IndexPath)
}

protocol CellConfig: CellAnyConfig {
    associatedtype CellType: UIView

    func setup(cell: CellType, at indexPath: IndexPath)
}

extension CellConfig {
    static var cellAnyType: UIView.Type {
        CellType.self
    }

    var identifier: String {
        String(describing: Self.cellAnyType.self)
    }

    func setupAny(cell: UIView, at indexPath: IndexPath) {
        guard let cell = cell as? CellType else { return }
        setup(cell: cell, at: indexPath)
    }
}
