import UIKit

// MARK: - Interface

protocol FlickrCoordinatorProtocol {
    func start()
}

// MARK: - Implementation

class FlickrCoordinator {
    // MARK: - Private properties

    private let navigationController: UINavigationController

    // MARK: - Initialization

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Weekly

private extension FlickrCoordinator {
    func presentSearchScreen() {
        let actions = FlickrSearchActions { [weak self] item in
            guard let self = self else { return }
            self.presentDetailsScreen(for: item)
        }
        
        let config = FlickrSearchConfig()
        let controller = FlickrSearchAssembly().build(with: config, actions: actions)

        navigationController.setViewControllers([controller], animated: false)
    }
}

// MARK: - Daily

private extension FlickrCoordinator {
    func presentDetailsScreen(for item: FlickrSearchPhoto) {
        let config = FlickrSearchDetailsConfig(title: item.title, item: item)
        let controller = FlickrSearchDetailsAssembly().build(with: config)

        navigationController.pushViewController(controller, animated: true)
    }
}

// MARK: - FlickrCoordinatorProtocol

extension FlickrCoordinator: FlickrCoordinatorProtocol {
    func start() {
        presentSearchScreen()
    }
}
