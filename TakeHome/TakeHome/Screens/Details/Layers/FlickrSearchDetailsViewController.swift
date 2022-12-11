import UIKit
import Kingfisher

class FlickrSearchDetailsViewController: UIViewController {
    // MARK: - Output

    var output: FlickrSearchDetailsViewControllerOutput!

    // MARK: - Properties

    var viewsFactory: FlickrSearchDetailsViewsFactoryProtocol!

    // MARK: - UI components

    var imageView: UIImageView!

    // MARK: - View lifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
        configureConstraints()

        output.load(request: .init())
    }
}

// MARK: - Actions

private extension FlickrSearchDetailsViewController {}

// MARK: - Configuration

private extension FlickrSearchDetailsViewController {
    func configureAppearance() {
        configureView()
        configureImageView()
    }

    func configureConstraints() {
        configureImageViewConstraints()
    }
}

// MARK: - View

private extension FlickrSearchDetailsViewController {
    func configureView() {
        view.backgroundColor = .white
    }
}

// MARK: - Image View

private extension FlickrSearchDetailsViewController {
    func configureImageView() {
        imageView = viewsFactory.makeImageView()
        view.addSubview(imageView)
    }
    
    func configureImageViewConstraints() {
        imageView.pin()
    }
}

// MARK: - Input

extension FlickrSearchDetailsViewController: FlickrSearchDetailsViewControllerInput {
    func show(load viewModel: FlickrSearchDetailsUseCases.Load.ViewModel) {
        imageView.kf.setImage(with: viewModel.url)
    }
}
