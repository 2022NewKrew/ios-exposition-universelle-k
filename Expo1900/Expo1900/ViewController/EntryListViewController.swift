import UIKit

class EntryListViewController: UIViewController {
    var tableView: UITableView = UITableView()
    var entryItems: [EntryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "한국의 출품작"
        navigationController?.setNavigationBarHidden(false, animated: false)
        view.addSubview(tableView)
        arrangeConstraint(view: tableView, guide: view.layoutMarginsGuide)
        tableView.delegate = self
        tableView.dataSource = self
        if let decodeResult = Decoder.decodeEntry(type: [EntryData].self, from: "items") {
            entryItems = decodeResult
        }
    }
}

extension EntryListViewController: UITableViewDelegate {
    
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = EntryTableViewCell()
        cell.makeEntryCell(data: entryItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thirdView = EntryDetailViewController()
        self.navigationController?.pushViewController(thirdView, animated: true)
        thirdView.pass(data: entryItems[indexPath.row])
    }
}
