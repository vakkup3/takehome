import UIKit
import Kingfisher

struct FlickrSearchTableViewCellConfig {
    private var model: FlickrSearchTableViewCellModelProtocol

    init(model: FlickrSearchTableViewCellModelProtocol) {
        self.model = model
    }
}

extension FlickrSearchTableViewCellConfig: CellConfig {
    func setup(cell: FlickrSearchTableViewCell, at indexPath: IndexPath) {
        cell.titleLabel.text = model.title
        cell.photoImageView.kf.setImage(with: model.url)
    }
}
