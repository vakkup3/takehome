import Foundation
@testable import TakeHome

class AdapterMock: AdapterProtocol {
    var reloadCalled = 0
    var reloadCellModels: [Any]?
    
    func reload(with cellModels: [Any]?) {
        reloadCalled += 1
        reloadCellModels = cellModels
    }
}
