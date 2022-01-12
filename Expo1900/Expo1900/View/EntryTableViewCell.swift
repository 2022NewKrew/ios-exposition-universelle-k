import UIKit

class EntryTableViewCell: UITableViewCell {
    
    static let identifier = "EntryTableViewCell"
    
    private let entryImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let entryName: UILabel = {
        let label: UILabel = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private let entryShortDescription: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    private let arrow: UILabel = {
        let label: UILabel = UILabel()
        label.text = ">"
        label.textColor = .gray
        return label
    }()
    
    lazy var textStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryName, entryShortDescription])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    lazy var entryInfomationStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryImage,textStack])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.alignment = .center
        
        return stackView
    }()
    
    lazy var entryStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryInfomationStack,arrow])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        return stackView
    }()
    
    func makeEntryCell(data: EntryData) {
        entryImage.image = UIImage(named: data.image)
        entryName.text = data.name
        entryShortDescription.text = data.shortDescription
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(entryStack)
        
        entryImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2).isActive = true
        entryImage.heightAnchor.constraint(equalTo: entryImage.widthAnchor).isActive = true
        
        entryStack.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        entryStack.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        entryStack.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        entryStack.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
