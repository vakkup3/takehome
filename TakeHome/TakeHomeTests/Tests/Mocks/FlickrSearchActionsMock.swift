import Foundation
@testable import TakeHome

class FlickrSearchActionsMock: FlickrSearchActionsProtocol {
    var selectActionCalled = 0
    
    var selectAction: ((FlickrSearchPhoto) -> Void)?
    
    init() {
        self.selectAction = { _ in
            self.selectActionCalled += 1
        }
    }
}
