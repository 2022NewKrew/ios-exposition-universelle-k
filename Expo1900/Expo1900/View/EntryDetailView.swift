import UIKit

class EntryDetailView: UIStackView {
    private let entryImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
        return imageView
    }()

    private let entryDescription: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    init(entry: EntryData) {
        super.init(frame: .zero)
        setUpStackView()
        setDetailView(data: entry)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpStackView() {
        self.addArrangedSubview(entryImage)
        self.addArrangedSubview(entryDescription)
        self.alignment = .center
        self.axis = .vertical
        self.distribution = .fill
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDetailView(data: EntryData) {
        entryImage.image = UIImage(named: data.image)
        entryDescription.text = data.detailDescription
    }
}
