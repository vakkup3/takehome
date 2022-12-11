import Foundation

struct URLNetworkEncoder {}

// MARK: - NetworkEncoderProtocol

extension URLNetworkEncoder: NetworkEncoderProtocol  {
    func encode(request: NetworkRequestProtocol) throws -> URLRequest {
        guard let url = request.absoluteURL else { throw NetworkServiceError.general }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        request.headers?.forEach{ (key, value) in
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        return urlRequest
    }
}
