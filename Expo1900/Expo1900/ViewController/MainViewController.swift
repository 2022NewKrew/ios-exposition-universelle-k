import UIKit

class MainViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "메인"
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(mainView)
        arrangeConstraint(view: scrollView, guide: view.safeAreaLayoutGuide)
        
        mainView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50).isActive = true
        
        mainView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
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
