import UIKit

class MainViewController: UIViewController {
    let scrollView = UIScrollView()
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "메인"
        //navigationController?.setNavigationBarHidden(true, animated: false)
        setUpUI()
    }
    
    func setUpUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        arrangeConstraint(view: scrollView, guide: view.safeAreaLayoutGuide)
        //scrollView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -40)
        
        arrangeConstraint(view: mainView, guide: scrollView.contentLayoutGuide)
        mainView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
    
    @objc
    func moveKoreanEntries() {
        let entryListView = EntryListViewController()
        self.navigationController?.pushViewController(entryListView, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
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
