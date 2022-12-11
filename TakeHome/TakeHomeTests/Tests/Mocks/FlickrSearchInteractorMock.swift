import Foundation
@testable import TakeHome

class FlickrSearchInteractorMock: FlickrSearchViewControllerOutput {
    var searchtCalled = 0
    var searchRequest: FlickrSearchUseCases.Search.Request?
    
    var selectCalled = 0
    var selectRequest: FlickrSearchUseCases.Select.Request?
    
    func search(request: FlickrSearchUseCases.Search.Request) {
        searchtCalled += 1
        searchRequest = request
    }
    
    func select(request: FlickrSearchUseCases.Select.Request) {
        selectCalled += 1
        selectRequest = request
    }
}
