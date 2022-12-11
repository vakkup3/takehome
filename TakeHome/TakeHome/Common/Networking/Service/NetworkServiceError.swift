import Foundation

enum NetworkServiceError: Error {
    case decoding(Error)
    case encoding(Error)
    case custom(HTTPURLResponse)
    case general
}

extension NetworkServiceError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decoding(let error):
            return error.localizedDescription
        case .encoding(let error):
            return error.localizedDescription
        case .custom(let response):
            return HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
        case .general:
            return "general network error"
        }
    }
}
