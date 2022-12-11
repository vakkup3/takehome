import Foundation

protocol NetworkPluginProtocol {
    func prepare(_ request: URLRequest) -> URLRequest
}
