import Foundation

protocol FlickrSearchDetailsMappable: NavigationTitleMappable {
    func map(load response: FlickrSearchDetailsUseCases.Load.Response)
}
