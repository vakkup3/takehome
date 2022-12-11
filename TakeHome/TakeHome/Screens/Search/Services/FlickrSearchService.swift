import CoreMotion

private enum Keys {
    static let method = "method"
    static let text = "text"
    static let extras = "extras"
    static let perPage = "per_page"
    static let format = "format"
    static let nojsoncallback = "nojsoncallback"
}

private enum Values {
    static let search = "flickr.photos.search"
    static let extras = "url_t,url_m"
    static let perPage = 25
    static let json = "json"
    static let nojsoncallback = 1
}

protocol FlickrSearchServiceProtocol {
    func search(text: String?, completion: @escaping ((Result<[FlickrSearchPhoto], Error>) -> Void))
}

struct FlickrSearchService: FlickrSearchServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}

// MARK: FlickrSearchServiceProtocol

extension FlickrSearchService {
    func search(text: String?, completion: @escaping ((Result<[FlickrSearchPhoto], Error>) -> Void)) {
        guard let text = text, text.count > 0 else {
            completion(.success([]))
            return
        }
        
        let queryParams: [String: Any] = [
            Keys.method: Values.search,
            Keys.text: text,
            Keys.extras: Values.extras,
            Keys.perPage: Values.perPage,
            Keys.format: Values.json,
            Keys.nojsoncallback: Values.nojsoncallback
        ]
        
        let request = NetworkRequest(configuration: FlickrNetworkConfiguration(), queryParams: queryParams)
        
        networkService.performDecoded(request: request, FlickrSearchResult.self) { result in
            DispatchQueue.main.async {
                guard case .success(let container) = result else {
                    completion(.failure(NetworkServiceError.general))
                    return
                }
                
                completion(.success(container.photos.photo))
            }
        }
    }
}
 
