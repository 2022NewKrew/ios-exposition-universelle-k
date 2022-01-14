import UIKit

class EntryDetailViewController: UIViewController {
    private let scrollView: UIScrollView
    private let detailView: EntryDetailView
    
    init(data: EntryData) {
        self.scrollView = UIScrollView()
        self.detailView = EntryDetailView(entry: data)
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
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        arrangeConstraint(view: scrollView, guide: view.safeAreaLayoutGuide)
        
        detailView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        detailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50).isActive = true
        detailView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    }
}
