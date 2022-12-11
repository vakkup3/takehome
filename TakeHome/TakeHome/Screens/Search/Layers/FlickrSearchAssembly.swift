import UIKit

// MARK: - Inputs and Outputs Connections

typealias FlickrSearchInteractorInput = FlickrSearchViewControllerOutput
typealias FlickrSearchMapperInput = FlickrSearchInteractorOutput
typealias FlickrSearchViewControllerInput = FlickrSearchMapperOutput

typealias FlickrSearchInteractorOutput = FlickrSearchMappable
typealias FlickrSearchViewControllerOutput = FlickrSearchInteractable
typealias FlickrSearchMapperOutput = FlickrSearchViewControllable

// MARK: - Assembly

class FlickrSearchAssembly {
    func build(with config: FlickrSearchConfigProtocol, actions: FlickrSearchActionsProtocol) -> UIViewController {
        let viewController = FlickrSearchViewController()

        let state = FlickrSearchState()
        let mapper = FlickrSearchMapper(output: viewController)

        let service = FlickrSearchService(
            networkService: NetworkService(
                plugins: [
                    FlickrKeyPlugin(configuration: FlickrNetworkConfiguration())
                ]
            )
        )
        
        let debouncer = FlickrSearchDebouncer()
        
        let interactor = FlickrSearchInteractor(
            output: mapper,
            state: state,
            service: service,
            debouncer: debouncer,
            actions: actions
        )

        let viewsFactory = FlickrSearchViewsFactory()
        let tableAdapter = TableViewAdapter(cellConfigsFactory: viewsFactory)

        viewController.output = interactor
        viewController.viewsFactory = viewsFactory
        viewController.tableAdapter = tableAdapter

        return viewController
    }
}
