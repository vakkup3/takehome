import Foundation

protocol NetworkServiceProtocol {
    func performDecoded<T: Decodable>(request: NetworkRequestProtocol, _ type: T.Type, completion: @escaping ((Result<T, Error>) -> Void))
}

struct NetworkService {
    static let domain = "com.takehome.networkservice"
    
    private let plugins: [NetworkPluginProtocol]
    
    init(plugins: [NetworkPluginProtocol]) {
        self.plugins = plugins
    }
}

// MARK: - NetworkServiceProtocol

extension NetworkService: NetworkServiceProtocol {
    func performDecoded<T: Decodable>(request: NetworkRequestProtocol, _ type: T.Type, completion: @escaping ((Result<T, Error>) -> Void)) {
        do {
            let encoder = request.encoder
            let decoder = request.decoder
            
            let urlRequest = try encoder.encode(request: request)
            let preparedRequest = self.plugins.reduce(urlRequest) { $1.prepare($0) }

            URLSession.shared.dataTask(with: preparedRequest) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NetworkServiceError.general))
                    return
                }
                
                do {
                    let decoded = try decoder.decode(T.self, data: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }
}
