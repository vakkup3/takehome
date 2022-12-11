import XCTest
@testable import TakeHome

final class FlickrSearchAssemblyTests: XCTestCase {
    var configMock: FlickrSearchConfigProtocol!
    var actionsMock: FlickrSearchActionsProtocol!
    
    var assembly: FlickrSearchAssembly!
    
    override func setUp() {
        super.setUp()
        
        configMock = FlickrSearchConfigMock()
        actionsMock = FlickrSearchActionsMock()
        
        assembly = FlickrSearchAssembly()
    }
    
    override func tearDown() {
        super.tearDown()
        
        configMock = nil
        actionsMock = nil
        
        assembly = nil
    }
    
    func testBuild() {
        // given
        
        // when
        let controller = assembly.build(with: configMock, actions: actionsMock)
        
        // then
        XCTAssertNotNil(controller)
    }
}
