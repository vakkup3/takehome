import XCTest
@testable import TakeHome

final class FlickrSearchMapperTests: XCTestCase {
    var controllerMock: FlickrSearchViewControllerMock!
    var mapper: FlickrSearchMapper!
    
    override func setUp() {
        super.setUp()
        
        controllerMock = FlickrSearchViewControllerMock()
        mapper = FlickrSearchMapper(output: controllerMock)
    }
    
    override func tearDown() {
        super.tearDown()
        
        controllerMock = nil
        mapper = nil
    }
    
    func testLoad() {
        // given
        let item = FlickrSearchPhoto.mock
        
        // when
        mapper.map(load: .init(items: [item]))
        
        // then
        XCTAssertEqual(controllerMock.loadCalled, 1)
        
        let cellModel = controllerMock.loadViewModel?.cellModels.first as? FlickrSearchTableViewCellModel
        XCTAssertEqual(cellModel?.title, item.title)
        XCTAssertEqual(cellModel?.url, URL(string: item.small))
    }
}
