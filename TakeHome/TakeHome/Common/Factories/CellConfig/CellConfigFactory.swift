import Foundation

protocol CellConfigFactoryProtocol {
    func cellConfig(from model: Any) -> CellAnyConfig
}
