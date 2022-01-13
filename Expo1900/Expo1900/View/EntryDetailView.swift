import UIKit

class EntryDetailView: UIStackView {
    private let entryImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let entryDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingStackView()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingStackView() {
        self.addArrangedSubview(entryImage)
        self.addArrangedSubview(entryDescription)
        self.alignment = .center
        self.axis = .vertical
        self.distribution = .fill
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setDetailView(data: EntryData) {
        entryImage.image = UIImage(named: data.image)
        entryDescription.text = data.detailDescription
    }
}
