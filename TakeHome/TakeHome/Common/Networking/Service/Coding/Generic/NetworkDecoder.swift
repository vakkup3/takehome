import Foundation

protocol NetworkDecoderProtocol {
    func decode<T: Decodable>(_ type: T.Type, data: Data) throws -> T
}
