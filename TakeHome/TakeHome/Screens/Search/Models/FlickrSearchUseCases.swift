import Foundation

enum FlickrSearchUseCases {}

// MARK: - Load

extension FlickrSearchUseCases {
    enum Load {
        struct Response {
            let items: [FlickrSearchPhoto]
        }
    }
}

// MARK: - Search

extension FlickrSearchUseCases {
    enum Search {
        struct Request {
            let text: String?
        }
    }
}

// MARK: - Select

extension FlickrSearchUseCases {
    enum Select {
        struct Request {
            let indexPath: IndexPath
        }
    }
}
