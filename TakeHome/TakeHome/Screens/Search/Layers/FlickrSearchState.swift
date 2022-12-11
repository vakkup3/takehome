import Foundation

protocol FlickrSearchStateProtocol: AnyObject {
    var items: [FlickrSearchPhoto] { get set }
}

class FlickrSearchState: FlickrSearchStateProtocol {
    var items: [FlickrSearchPhoto] = []
}
