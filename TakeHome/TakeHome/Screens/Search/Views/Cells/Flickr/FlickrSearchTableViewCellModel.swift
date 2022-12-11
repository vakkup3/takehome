import Foundation

protocol FlickrSearchTableViewCellModelProtocol {
    var title: String { get }
    var url: URL? { get }
}

struct FlickrSearchTableViewCellModel: FlickrSearchTableViewCellModelProtocol {
    let title: String
    let url: URL?
}
