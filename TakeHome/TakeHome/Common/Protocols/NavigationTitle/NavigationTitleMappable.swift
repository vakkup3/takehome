import Foundation

protocol NavigationTitleMappable {
    var navigationTitleShowable: NavigationTitleShowable? { get }

    func map(navigationTitle response: NavigationTitleUseCases.Update.Response)
}

extension NavigationTitleMappable {
    func map(navigationTitle response: NavigationTitleUseCases.Update.Response) {
        navigationTitleShowable?.show(
            navigationTitle: .init(title: response.title)
        )
    }
}
