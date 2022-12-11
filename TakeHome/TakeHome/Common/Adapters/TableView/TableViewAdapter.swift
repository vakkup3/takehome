import UIKit

protocol TableViewAdapterProtocol: AdapterProtocol, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView? { get set }
    var onSelect: ((IndexPath) -> Void)? { get set }
}

class TableViewAdapter: NSObject, TableViewAdapterProtocol {
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
            tableView?.delegate = self
        }
    }

    var onSelect: ((IndexPath) -> Void)?

    private var cellConfigs: [CellAnyConfig] = []
    private var cellConfigsFactory: CellConfigFactoryProtocol!

    init(cellConfigsFactory: CellConfigFactoryProtocol!) {
        self.cellConfigsFactory = cellConfigsFactory
    }
}

// MARK: - UITableViewDataSource

extension TableViewAdapter {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        cellConfigs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withModel: cellConfigs[indexPath.row], at: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension TableViewAdapter {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelect?(indexPath)
    }
}

// MARK: - Reloading

extension TableViewAdapter {
    func reload(with cellModels: [Any]?) {
        cellConfigs = cellModels?.compactMap { cellConfigsFactory.cellConfig(from: $0) } ?? []
        tableView?.reloadData()
    }
}
