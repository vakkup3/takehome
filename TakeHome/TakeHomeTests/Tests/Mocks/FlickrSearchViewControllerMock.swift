import Foundation
@testable import TakeHome

class FlickrSearchViewControllerMock: FlickrSearchMapperOutput {
    var loadCalled = 0
    var loadViewModel: CellConfigUseCases.Load.ViewModel?
    
    var adapter: AdapterProtocol!
    
    func show(load viewModel: CellConfigUseCases.Load.ViewModel) {
        loadCalled += 1
        loadViewModel = viewModel
    }
}
