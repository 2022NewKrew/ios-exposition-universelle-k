import UIKit

class EntryDetailView: UIStackView {
    private var entryImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private var entryDescription: UILabel = {
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
    
    func makeDetailView(data: EntryData) {
        entryImage.image = UIImage(named: data.image)
        entryDescription.text = data.detailDescription
    }
}
