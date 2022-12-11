import Foundation

protocol FlickrSearchInteractable: ControllerLifecycleInteractable {
    func search(request: FlickrSearchUseCases.Search.Request)
    func select(request: FlickrSearchUseCases.Select.Request)
}
