import UIKit

class EntryListViewController: UIViewController, UITableViewDelegate {
    var tableView: UITableView = UITableView()
    var entryItems: [EntryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "한국의 출품작"
        
        setUpTableView()
        
        if let decodeResult = Decoder.decodeJSONData(type: [EntryData].self, from: "items") {
            entryItems = decodeResult
        }
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        arrangeConstraint(view: tableView, guide: view.safeAreaLayoutGuide)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryTableViewCell.identifier) as? EntryTableViewCell ?? EntryTableViewCell()
        cell.setEntryCell(data: entryItems[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entryDetailView = EntryDetailViewController(data: entryItems[indexPath.row])
        self.navigationController?.pushViewController(entryDetailView, animated: true)
    }
}
