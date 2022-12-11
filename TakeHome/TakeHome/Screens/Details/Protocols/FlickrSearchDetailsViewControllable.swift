import Foundation

protocol FlickrSearchDetailsViewControllable: NavigationTitleShowable, AnyObject {
    func show(load viewModel: FlickrSearchDetailsUseCases.Load.ViewModel)
}
