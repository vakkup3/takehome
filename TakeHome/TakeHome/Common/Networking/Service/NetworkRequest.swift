import Foundation
 
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

protocol NetworkRequestProtocol {
    var configuration: NetworkConfigurationProtocol { get }
    
    var baseURL: URL? { get }
    var path: String { get }
    
    var absoluteURL: URL? { get }
    var method: HTTPMethod { get }
    
    var encoder: NetworkEncoderProtocol { get }
    var decoder: NetworkDecoderProtocol { get }
    
    var headers: [String: String]? { get }
    var queryParams: [String: Any]? { get }
    var bodyParams: [String: Any]? { get }
}

class NetworkRequest: NetworkRequestProtocol {
    var configuration: NetworkConfigurationProtocol
    
    var baseURL: URL? {
        return configuration.baseURL
    }
    
    var path: String {
        return ""
    }

    var absoluteURL: URL? {
        guard let url = baseURL, var components = URLComponents(string: path) else { return baseURL }

        var params: [String: Any] = [:]
        
        queryParams.flatMap { queryParams in
            return params = params.merging(queryParams) { $1 }
        }
        
        if !params.isEmpty {
            components.queryItems = params.map { URLQueryItem(name: $0, value: String(describing: $1)) }
        }
        
        guard let path = components.url?.absoluteString else { return url }
        
        return url.appendingPathComponent(path)
    }

    var method: HTTPMethod {
        return .get
    }
    
    var encoder: NetworkEncoderProtocol {
        return URLNetworkEncoder()
    }
    
    var decoder: NetworkDecoderProtocol {
        return JSONNetworkDecoder()
    }
    
    var headers: [String: String]?
    var queryParams: [String: Any]?
    var bodyParams: [String: Any]?
    
    init(
        configuration: NetworkConfigurationProtocol,
        headers: [String: String]? = nil,
        queryParams: [String: Any]? = nil,
        bodyParams: [String: Any]? = nil
    ) {
        self.configuration = configuration
        self.queryParams = queryParams
        self.bodyParams = bodyParams
    }
}
