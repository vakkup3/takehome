import Foundation

class FlickrSearchInteractor: FlickrSearchInteractorInput {
    // MARK: - Output

    private let output: FlickrSearchInteractorOutput

    // MARK: - State

    private let state: FlickrSearchStateProtocol
    
    // MARK: - Service

    private let service: FlickrSearchServiceProtocol

    // MARK: - Debouncer
    
    private let debouncer: FlickrSearchDebouncingProtocol
    
    // MARK: - Actions

    private let actions: FlickrSearchActionsProtocol

    init(
        output: FlickrSearchInteractorOutput,
        state: FlickrSearchStateProtocol,
        service: FlickrSearchServiceProtocol,
        debouncer: FlickrSearchDebouncingProtocol,
        actions: FlickrSearchActionsProtocol
    ) {
        self.output = output
        self.state = state
        self.service = service
        self.debouncer = debouncer
        self.actions = actions
    }
}

// MARK: - Search

extension FlickrSearchInteractor {
    func search(request: FlickrSearchUseCases.Search.Request) {
        debouncer.run {
            self.service.search(text: request.text) { [weak self] result in
                guard let self = self else { return }
                
                guard case let .success(items) = result else {
                    // TODO: Show error dialog if needed
                    return
                }
                
                self.state.items = items
                
                let response = FlickrSearchUseCases.Load.Response(items: items)
                self.output.map(load: response)
            }
        }
    }
}

// MARK: - Select

extension FlickrSearchInteractor {
    func select(request: FlickrSearchUseCases.Select.Request) {
        guard request.indexPath.row < state.items.count else { return }
        
        actions.selectAction?(state.items[request.indexPath.row])
    }
}
