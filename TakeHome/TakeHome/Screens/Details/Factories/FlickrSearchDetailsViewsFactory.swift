import UIKit

protocol FlickrSearchDetailsViewsFactoryProtocol {
    func makeImageView() -> UIImageView
}

struct FlickrSearchDetailsViewsFactory: FlickrSearchDetailsViewsFactoryProtocol {
    func makeImageView() -> UIImageView {
        let view = UIImageView()

        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        
        return view
    }
}
