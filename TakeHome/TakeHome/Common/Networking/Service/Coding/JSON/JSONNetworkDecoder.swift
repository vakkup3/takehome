import Foundation

struct JSONNetworkDecoder {
    private let decoder = JSONDecoder()
}

// MARK: NetworkDecoderProtocol

extension JSONNetworkDecoder: NetworkDecoderProtocol {
    func decode<T>(_ type: T.Type, data: Data) throws -> T where T : Decodable {
        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw NetworkServiceError.decoding(error)
        }
    }
}
