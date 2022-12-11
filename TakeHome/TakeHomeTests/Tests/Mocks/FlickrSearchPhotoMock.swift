import Foundation
@testable import TakeHome

extension FlickrSearchPhoto {
    static var mock: FlickrSearchPhoto {
        return FlickrSearchPhoto(id: "id", title: "title", small: "https://flickr.com", large: "https://flickr.com")
    }
}
