import XCTest
@testable import TakeHome

final class FlickrSearchInteractorTests: XCTestCase {
    var mapperMock: FlickrSearchMapperMock!
    var stateMock: FlickrSearchStateMock!
    var serviceMock: FlickrSearchServiceMock!
    var actionsMock: FlickrSearchActionsMock!
    var debouncerMock: FlickrSearchDebouncerMock!
    
    var interactor: FlickrSearchInteractor!
    
    override func setUp() {
        super.setUp()
        
        mapperMock = FlickrSearchMapperMock()
        stateMock = FlickrSearchStateMock()
        serviceMock = FlickrSearchServiceMock()
        actionsMock = FlickrSearchActionsMock()
        debouncerMock = FlickrSearchDebouncerMock()
        
        interactor = FlickrSearchInteractor(
            output: mapperMock,
            state: stateMock,
            service: serviceMock,
            debouncer: debouncerMock,
            actions: actionsMock
        )
    }
    
    override func tearDown() {
        super.tearDown()
        
        mapperMock = nil
        stateMock = nil
        serviceMock = nil
        actionsMock = nil
        debouncerMock = nil
        
        interactor = nil
    }
    
    func testSelect() {
        // given
        let indexPath = IndexPath(row: 0, section: 0)
        stateMock.itemsMock = [FlickrSearchPhoto.mock]
        
        // when
        interactor.select(request: .init(indexPath: indexPath))
        
        // then
        XCTAssertEqual(actionsMock.selectActionCalled, 1)
    }
    
    func testSearch() {
        // given
        let text = "text"
        let item = FlickrSearchPhoto.mock
        
        serviceMock.resultMock = .success([item])
        
        // when
        interactor.search(request: .init(text: text))
        
        // then
        XCTAssertEqual(debouncerMock.runCalled, 1)
        XCTAssertEqual(serviceMock.searchCalled, 1)
        
        XCTAssertEqual(stateMock.itemsMock.first?.id, item.id)
        
        XCTAssertEqual(mapperMock.loadCalled, 1)
        XCTAssertEqual(mapperMock.loadResponse?.items.first?.id, item.id)
    }
    
    func testLoadFailed() {
        // given
        let text = "text"
        serviceMock.resultMock = .failure(NetworkServiceError.general)
        
        // when
        interactor.search(request: .init(text: text))
        
        // then
        XCTAssertEqual(debouncerMock.runCalled, 1)
        XCTAssertEqual(serviceMock.searchCalled, 1)

        XCTAssertEqual(mapperMock.loadCalled, 0)
    }
}
