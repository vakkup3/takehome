import UIKit

protocol TableViewControllerConfigurable: AnyObject {
    var tableView: UITableView! { get set }
    var tableViewFactory: TableViewFactoryProtocol { get }
    var tableAdapter: TableViewAdapterProtocol! { get set }

    func configureTableView()
    func configureTableViewConstraints()
}

extension TableViewControllerConfigurable where Self: UIViewController {
    func configureTableView() {
        tableView = tableViewFactory.makeTableView()
        tableAdapter.tableView = tableView

        view.addSubview(tableView)
    }

    func configureTableViewConstraints() {
        tableView.pin(safeArea: true)
    }
}
