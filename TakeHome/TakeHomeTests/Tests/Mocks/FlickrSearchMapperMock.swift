import Foundation
@testable import TakeHome

class FlickrSearchMapperMock: FlickrSearchInteractorOutput {
    var loadCalled = 0
    var loadResponse: FlickrSearchUseCases.Load.Response?
    
    func map(load response: FlickrSearchUseCases.Load.Response) {
        loadCalled += 1
        loadResponse = response
    }
}
