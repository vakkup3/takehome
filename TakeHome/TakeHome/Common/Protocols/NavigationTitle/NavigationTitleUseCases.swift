import Foundation

enum NavigationTitleUseCases {
    enum Update {
        struct Response {
            let title: String?

            init(title: String?) {
                self.title = title
            }
        }

        struct ViewModel {
            let title: String?

            init(title: String?) {
                self.title = title
            }
        }
    }
}
