import UIKit

class EntryDetailViewController: UIViewController {
    private let entryDescription: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    private let entryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var totalView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [scrollView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var detailView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryImage, entryDescription])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        return stackView
    }()
    
    private let scrollView: UIScrollView
    
    lazy var landscapeConstraints = [
        entryImage.widthAnchor.constraint(equalTo: totalView.widthAnchor, multiplier: 0.3),
        scrollView.heightAnchor.constraint(equalTo: totalView.heightAnchor)
    ]
    lazy var portraitConstraints = [
        scrollView.heightAnchor.constraint(equalTo: totalView.heightAnchor)
    ]
    
    init(data: EntryData) {
        self.scrollView = UIScrollView()
        super.init(nibName: nil, bundle: nil)
        setDetailView(data: data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        changeViewLayout(size: size)
    }
    
    private func setupUI() {
        view.addSubview(totalView)
        scrollView.addSubview(detailView)
        arrangeConstraint(view: totalView, guide: view.safeAreaLayoutGuide)
        
        detailView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50).isActive = true
        detailView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        changeViewLayout(size: view.bounds.size)
    }
    
    private func setDetailView(data: EntryData) {
        navigationItem.title = data.name
        entryImage.image = UIImage(named: data.image)
        entryDescription.text = data.detailDescription
    }
    
    private func changeViewLayout(size: CGSize){
        if size.width > size.height {
            totalView.axis = .horizontal
            entryImage.removeFromSuperview()
            totalView.insertArrangedSubview(entryImage, at: 0)
            NSLayoutConstraint.activate(landscapeConstraints)
            NSLayoutConstraint.deactivate(portraitConstraints)
        }
        else {
            totalView.axis = .vertical
            entryImage.removeFromSuperview()
            detailView.insertArrangedSubview(entryImage, at: 0)
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
}
