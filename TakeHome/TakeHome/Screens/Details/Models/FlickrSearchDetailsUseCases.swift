import Foundation

enum FlickrSearchDetailsUseCases {}

// MARK: - Load

extension FlickrSearchDetailsUseCases {
    enum Load {
        struct Response {
            let item: FlickrSearchPhoto
        }
        
        struct ViewModel {
            let url: URL?
        }
    }
}
