import UIKit

class MainViewController: UIViewController {
    let scrollView = UIScrollView()
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "메인"
        navigationController?.setNavigationBarHidden(true, animated: false)
        createUI()
    }
    
    func createUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        arrangeConstraint(view: scrollView, guide: view.layoutMarginsGuide)
        arrangeConstraint(view: mainView, guide: scrollView.contentLayoutGuide)
        mainView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
    
    @objc
    func toKoreanEntries() {
        let secondView = EntryListViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
}

extension UIViewController {
    func arrangeConstraint(view: UIView, guide: UILayoutGuide) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
}
