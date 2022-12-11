import UIKit

class FlickrSearchTableViewCell: UITableViewCell {
    // MARK: - Private

    private var contentStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)

        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16.0
        
        return stackView
    }()
    
    private(set) lazy var photoImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        
        return view
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Initialisation

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureAppearance()
        configureConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

private extension FlickrSearchTableViewCell {
    func configureAppearance() {
        configureContentStackView()
        configurePhotoImageView()
        configureTitleLabel()
    }

    func configureConstraints() {
        configureContentStackViewConstraints()
        configurePhotoImageViewConstraints()
    }
}

// MARK: - ContentStackView

private extension FlickrSearchTableViewCell {
    func configureContentStackView() {
        contentView.addSubview(contentStackView)
    }

    func configureContentStackViewConstraints() {
        contentStackView.pinTop(with: 8)
        contentStackView.pinLeft(with: 16)
        contentStackView.pinRight(with: 16)
        
        contentStackView.pinBottom(with: 8).priority = .defaultLow
    }
}

// MARK: - Photo

private extension FlickrSearchTableViewCell {
    func configurePhotoImageView() {
        contentStackView.addArrangedSubview(photoImageView)
    }
    
    func configurePhotoImageViewConstraints() {
        photoImageView.pinWidth(to: 90)
        photoImageView.pinHeight(to: 60)
    }
}

// MARK: - Title

private extension FlickrSearchTableViewCell {
    func configureTitleLabel() {
        contentStackView.addArrangedSubview(titleLabel)
    }
}
