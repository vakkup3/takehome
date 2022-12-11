import UIKit

protocol CellConfigShowable: AnyObject {
    var adapter: AdapterProtocol! { get }

    func show(load viewModel: CellConfigUseCases.Load.ViewModel)
}

extension CellConfigShowable where Self: UIViewController {
    func show(load viewModel: CellConfigUseCases.Load.ViewModel) {
        adapter.reload(with: viewModel.cellModels)
    }
}
