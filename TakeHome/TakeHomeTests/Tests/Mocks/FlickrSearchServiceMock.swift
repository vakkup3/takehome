import Foundation
@testable import TakeHome

class FlickrSearchServiceMock: FlickrSearchServiceProtocol {
    var searchCalled = 0
    
    var textMock: String?
    var resultMock: Result<[FlickrSearchPhoto], Error>?
    
    func search(text: String?, completion: @escaping ((Result<[FlickrSearchPhoto], Error>) -> Void)) {
        searchCalled += 1
        textMock = text
        
        resultMock.flatMap { completion($0) }
    }
}
