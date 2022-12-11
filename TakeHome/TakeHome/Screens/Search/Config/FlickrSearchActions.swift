import Foundation

protocol FlickrSearchActionsProtocol {
    var selectAction: ((FlickrSearchPhoto) -> Void)? { get }
}

struct FlickrSearchActions: FlickrSearchActionsProtocol {
    let selectAction: ((FlickrSearchPhoto) -> Void)?
    
    init(selectAction: ((FlickrSearchPhoto) -> Void)? = nil) {
        self.selectAction = selectAction
    }
}
