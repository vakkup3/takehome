import UIKit

protocol NavigationTitleShowable {
    func show(navigationTitle viewModel: NavigationTitleUseCases.Update.ViewModel)
}

extension NavigationTitleShowable where Self: UIViewController {
    func show(navigationTitle viewModel: NavigationTitleUseCases.Update.ViewModel) {
        navigationItem.title = viewModel.title
    }
}
