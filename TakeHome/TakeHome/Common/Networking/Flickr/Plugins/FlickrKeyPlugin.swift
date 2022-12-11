import Foundation

private enum Constants {
    static let key = "api_key"
}

struct FlickrKeyPlugin {
    let configuration: FlickrNetworkConfigurationProtocol
}

// MARK: - NetworkPluginProtocol

extension FlickrKeyPlugin: NetworkPluginProtocol {
    func prepare(_ request: URLRequest) -> URLRequest {
        var request = request
        
        guard let urlString = request.url?.absoluteString.removingPercentEncoding, var components = URLComponents(string: urlString) else {
            return request
        }
        
        var queryItems: [URLQueryItem] = components.queryItems ?? []
        queryItems.append(URLQueryItem(name: Constants.key, value: configuration.apiKey))
                
        components.queryItems = queryItems
        request.url = components.url
        
        return request
    }
}
