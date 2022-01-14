import UIKit

class EntryTableViewCell: UITableViewCell {
    
    static let identifier = "entryCell"
    
    private let entryImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let entryName: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        return label
    }()
    
    private let entryShortDescription: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    private lazy var textStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryName, entryShortDescription])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var entryInfomationStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryImage, textStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .center
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setEntryCell(data: EntryData) {
        entryImage.image = UIImage(named: data.image)
        entryName.text = data.name
        entryShortDescription.text = data.shortDescription
    }
    
    private func setUpView() {
        contentView.addSubview(entryInfomationStack)
        
        entryImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        entryImage.heightAnchor.constraint(equalTo: entryImage.widthAnchor).isActive = true
        
        entryInfomationStack.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        entryInfomationStack.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        entryInfomationStack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        entryInfomationStack.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
    }
}
