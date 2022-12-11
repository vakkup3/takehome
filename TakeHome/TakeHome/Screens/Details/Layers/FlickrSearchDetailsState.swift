import Foundation

protocol FlickrSearchDetailsStateProtocol: AnyObject {
    var title: String { get }
    var item: FlickrSearchPhoto { get }
}

class FlickrSearchDetailsState: FlickrSearchDetailsStateProtocol {
    let title: String
    let item: FlickrSearchPhoto
    
    init(title: String, item: FlickrSearchPhoto) {
        self.title = title
        self.item = item
    }
}
