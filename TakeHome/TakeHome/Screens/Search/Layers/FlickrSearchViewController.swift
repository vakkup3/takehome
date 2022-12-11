import UIKit

class FlickrSearchViewController: UIViewController {
    // MARK: - Output

    var output: FlickrSearchViewControllerOutput!

    // MARK: - Properties

    var viewsFactory: FlickrSearchViewsFactoryProtocol!

    // MARK: - Search

    var searchBar: UISearchBar!
    
    // MARK: - TableView components

    var tableView: UITableView!
    var tableViewFactory: TableViewFactoryProtocol { viewsFactory }
    var tableAdapter: TableViewAdapterProtocol!

    var adapter: AdapterProtocol! { return tableAdapter }

    // MARK: - View lifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
        configureConstraints()

        output.load(request: .init())
    }
}

// MARK: - Actions

private extension FlickrSearchViewController {}

// MARK: - Configuration

private extension FlickrSearchViewController {
    func configureAppearance() {
        configureView()
        configureSearchBar()
        configureTableView()
        configureTableViewAdapter()
    }

    func configureConstraints() {
        configureTableViewConstraints()
    }
}

// MARK: - View

private extension FlickrSearchViewController {
    func configureView() {
        view.backgroundColor = .white
    }
}

// MARK: - Search

private extension FlickrSearchViewController {
    func configureSearchBar() {
        searchBar = viewsFactory.makeSearchBar()
        searchBar.delegate = self
        
        navigationItem.titleView = searchBar
    }
}

// MARK: - Adapter

private extension FlickrSearchViewController {
    func configureTableViewAdapter() {
        tableAdapter.onSelect = { [weak self] indexPath in
            self?.output.select(request: FlickrSearchUseCases.Select.Request(indexPath: indexPath))
        }
    }
}

// MARK: - UISearchBarDelegate

extension FlickrSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        output.search(request: .init(text: searchText))
    }
}

// MARK: - Configurable

extension FlickrSearchViewController: TableViewControllerConfigurable {}

// MARK: - Input

extension FlickrSearchViewController: FlickrSearchViewControllerInput {}
