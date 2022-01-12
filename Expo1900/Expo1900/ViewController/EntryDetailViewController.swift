import UIKit

class EntryDetailViewController: UIViewController {
    let scrollView = UIScrollView()
    let detailView = EntryDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createUI()
    }
    
    func pass(data: EntryData) {
        navigationItem.title = data.name
        detailView.makeDetailView(data: data)
    }
    
    func createUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(detailView)
        arrangeConstraint(view: scrollView, guide: view.layoutMarginsGuide)
        arrangeConstraint(view: detailView, guide: scrollView.contentLayoutGuide)
        detailView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
}
