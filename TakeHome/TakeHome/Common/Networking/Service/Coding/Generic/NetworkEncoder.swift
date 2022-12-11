import Foundation

protocol NetworkEncoderProtocol {
    func encode(request: NetworkRequestProtocol) throws -> URLRequest
}
