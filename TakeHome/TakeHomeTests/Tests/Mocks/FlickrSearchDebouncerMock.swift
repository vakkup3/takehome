import Foundation
@testable import TakeHome

class FlickrSearchDebouncerMock: FlickrSearchDebouncingProtocol {
    var runCalled = 0
    var cancelCalled = 0
    
    func run(action: @escaping () -> Void) {
        runCalled += 1
        action()
    }
    
    func cancel() {
        cancelCalled += 1
    }
}
