import UIKit

// MARK: - Inputs and Outputs Connections

typealias FlickrSearchDetailsInteractorInput = FlickrSearchDetailsViewControllerOutput
typealias FlickrSearchDetailsMapperInput = FlickrSearchDetailsInteractorOutput
typealias FlickrSearchDetailsViewControllerInput = FlickrSearchDetailsMapperOutput

typealias FlickrSearchDetailsInteractorOutput = FlickrSearchDetailsMappable
typealias FlickrSearchDetailsViewControllerOutput = FlickrSearchDetailsInteractable
typealias FlickrSearchDetailsMapperOutput = FlickrSearchDetailsViewControllable

// MARK: - Assembly

class FlickrSearchDetailsAssembly {
    func build(with config: FlickrSearchDetailsConfigProtocol) -> UIViewController {
        let viewController = FlickrSearchDetailsViewController()

        let state = FlickrSearchDetailsState(title: config.title, item: config.item)
        let mapper = FlickrSearchDetailsMapper(output: viewController)
        
        let interactor = FlickrSearchDetailsInteractor(output: mapper, state: state)

        let viewsFactory = FlickrSearchDetailsViewsFactory()

        viewController.output = interactor
        viewController.viewsFactory = viewsFactory

        return viewController
    }
}
