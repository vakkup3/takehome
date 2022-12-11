import Foundation

protocol FlickrSearchMappable {
    func map(load response: FlickrSearchUseCases.Load.Response)
}
