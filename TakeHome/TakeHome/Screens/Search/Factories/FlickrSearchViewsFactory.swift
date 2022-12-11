import UIKit

protocol FlickrSearchViewsFactoryProtocol: TableViewFactoryProtocol, CellConfigFactoryProtocol {
    func makeSearchBar() -> UISearchBar
}

struct FlickrSearchViewsFactory: FlickrSearchViewsFactoryProtocol {
    func makeSearchBar() -> UISearchBar {
        let searchBar = UISearchBar()
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.sizeToFit()
        
        return searchBar
    }
}

// MARK: - Cells

extension FlickrSearchViewsFactory {
    func cellConfig(from model: Any) -> CellAnyConfig {
        switch model {
        case let model as FlickrSearchTableViewCellModelProtocol:
            return FlickrSearchTableViewCellConfig(model: model)

        default:
            fatalError("unhandled case")
        }
    }
}
