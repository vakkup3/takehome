import Foundation

struct FlickrSearchResult: Codable {
    let photos: FlickrSearchPage
}

struct FlickrSearchPage: Codable {
    let photo: [FlickrSearchPhoto]
}

struct FlickrSearchPhoto: Codable {
    let id: String
    let title: String
    let small: String
    let large: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case small = "url_t"
        case large = "url_m"
    }
}
