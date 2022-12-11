import Foundation

class FlickrSearchDetailsInteractor: FlickrSearchDetailsInteractorInput {
    // MARK: - Output

    private let output: FlickrSearchDetailsInteractorOutput

    // MARK: - State

    private let state: FlickrSearchDetailsStateProtocol
    
    init(output: FlickrSearchDetailsInteractorOutput, state: FlickrSearchDetailsStateProtocol) {
        self.output = output
        self.state = state
    }
}

// MARK: - LifeCycle

extension FlickrSearchDetailsInteractor {
    func load(request _: ControllerLifecycleUseCases.Load.Request) {
        output.map(navigationTitle: .init(title: state.title))
        
        let response = FlickrSearchDetailsUseCases.Load.Response(item: state.item)
        output.map(load: response)
    }
}
