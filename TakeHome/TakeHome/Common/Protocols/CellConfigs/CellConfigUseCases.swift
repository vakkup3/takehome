import Foundation

enum CellConfigUseCases {}

// MARK: - Load

extension CellConfigUseCases {
    enum Load {
        struct ViewModel {
            let cellModels: [Any]

            init(cellModels: [Any]) {
                self.cellModels = cellModels
            }
        }
    }
}
