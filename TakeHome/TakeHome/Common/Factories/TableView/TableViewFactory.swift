import UIKit

protocol TableViewFactoryProtocol {
    func makeTableView() -> UITableView
}

// MARK: - TableView

extension TableViewFactoryProtocol {
    func makeTableView() -> UITableView {
        let tableView = UITableView()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.backgroundView = nil

        return tableView
    }
}
