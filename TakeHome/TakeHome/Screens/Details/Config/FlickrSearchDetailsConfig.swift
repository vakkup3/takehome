import Foundation

protocol FlickrSearchDetailsConfigProtocol {
    var title: String { get }
    var item: FlickrSearchPhoto { get }
}

struct FlickrSearchDetailsConfig: FlickrSearchDetailsConfigProtocol {
    let title: String
    let item: FlickrSearchPhoto
}
