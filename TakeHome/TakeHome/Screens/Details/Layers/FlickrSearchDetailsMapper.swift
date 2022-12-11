import UIKit

struct FlickrSearchDetailsMapper: FlickrSearchDetailsMapperInput {
    // MARK: - Output

    weak var output: FlickrSearchDetailsMapperOutput?
    
    // MARK: - Conformance
    
    var navigationTitleShowable: NavigationTitleShowable? { output }
}

// MARK: - Loading

extension FlickrSearchDetailsMapper {
    func map(load response: FlickrSearchDetailsUseCases.Load.Response) {
        output?.show(load: .init(url: response.item.large.flatMap { URL(string: $0) }))
    }
}
