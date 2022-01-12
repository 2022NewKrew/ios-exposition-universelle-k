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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        entryItems = Decoder.decodeEntry(type: [EntryData].self, from: "items") ?? entryItems
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
}
