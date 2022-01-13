import UIKit

class EntryDetailViewController: UIViewController {
    let scrollView = UIScrollView()
    let detailView = EntryDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
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
