import UIKit

class EntryDetailViewController: UIViewController {
    let scrollView: UIScrollView
    let detailView: EntryDetailView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    init(data: EntryData) {
        self.scrollView = UIScrollView()
        self.detailView = EntryDetailView(entry: data)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(entry: EntryData) {
        navigationItem.title = entry.name
        detailView.setDetailView(data: entry)
    }
    
    private func setupUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        arrangeConstraint(view: scrollView, guide: view.safeAreaLayoutGuide)
        arrangeConstraint(view: detailView, guide: scrollView.contentLayoutGuide)
        detailView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
}
