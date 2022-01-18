import UIKit

class EntryDetailViewController: UIViewController {
    private let entryImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var totalView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [entryImage, scrollView])
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private let scrollView: UIScrollView
    private let detailView: EntryDetailView
    
    init(data: EntryData) {
        self.scrollView = UIScrollView()
        self.detailView = EntryDetailView(entry: data)
        entryImage.image = UIImage(named: data.image)
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = data.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(totalView)
        scrollView.addSubview(detailView)
        arrangeConstraint(view: totalView, guide: view.safeAreaLayoutGuide)
        
        detailView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50).isActive = true
        detailView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        let landscapeConstraints = [
            entryImage.widthAnchor.constraint(equalTo: totalView.widthAnchor, multiplier: 0.3),
            scrollView.heightAnchor.constraint(equalTo: totalView.heightAnchor)
        ]
        let portraitConstraints = [
            entryImage.widthAnchor.constraint(equalToConstant: 0),
            scrollView.heightAnchor.constraint(equalTo: totalView.heightAnchor)
        ]
        
        if UIDevice.current.orientation.isLandscape {
            totalView.axis = .horizontal
            NSLayoutConstraint.activate(landscapeConstraints)
            NSLayoutConstraint.deactivate(portraitConstraints)
        }
        else {
            totalView.axis = .vertical
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
}
