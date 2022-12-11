import UIKit

extension UITableView {
    func dequeueReusableCell(withModel model: CellAnyConfig, at indexPath: IndexPath) -> UITableViewCell {
        var cell = dequeueReusableCell(withIdentifier: model.identifier)

        if cell == nil {
            register(type(of: model))
            cell = dequeueReusableCell(withIdentifier: model.identifier)
        }

        guard let cell = cell else { fatalError("missing cell for identifier: \(model.identifier)") }
        model.setupAny(cell: cell, at: indexPath)

        return cell
    }

    func register(_ cellModels: CellAnyConfig.Type...) {
        cellModels.forEach {
            register($0.cellAnyType, forCellReuseIdentifier: String(describing: $0.cellAnyType))
        }
    }
}
