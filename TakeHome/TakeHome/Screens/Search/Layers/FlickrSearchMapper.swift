import UIKit

struct FlickrSearchMapper: FlickrSearchMapperInput {
    // MARK: - Output

    weak var output: FlickrSearchMapperOutput?
}

// MARK: - Loading

extension FlickrSearchMapper {
    func map(load response: FlickrSearchUseCases.Load.Response) {
        output?.show(
            load: .init(
                cellModels: response.items.compactMap {
                    FlickrSearchTableViewCellModel(title: $0.title, url: URL(string: $0.small))
                }
            )
        )
    }
}
