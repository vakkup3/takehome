import Foundation
@testable import TakeHome

class FlickrSearchStateMock: FlickrSearchStateProtocol {
    var itemsMock: [FlickrSearchPhoto] = []
    
    var items: [FlickrSearchPhoto] {
        get { return  itemsMock }
        set { itemsMock = newValue }
    }
}
