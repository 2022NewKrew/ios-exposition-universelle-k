import UIKit

class EntryListViewController: UIViewController {
    private var tableView: UITableView = UITableView()
    private var entryItems: [EntryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "한국의 출품작"
        
        setUpTableView()
        
        if let decodeResult = Decoder.decodeJSONData(type: [EntryData].self, from: "items") {
            entryItems = decodeResult
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UIDevice.current.orientation.rawValue != self.navigationController?.interfaceOrientation.rawValue {

            DispatchQueue.main.async {
                UINavigationController.attemptRotationToDeviceOrientation()
            }
        }
        print(UIDevice.current.orientation.rawValue)
        print(self.navigationController?.interfaceOrientation.rawValue)
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        arrangeConstraint(view: tableView, guide: view.safeAreaLayoutGuide)
        tableView.register(EntryTableViewCell.self, forCellReuseIdentifier: EntryTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension EntryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entryDetailView = EntryDetailViewController(data: entryItems[indexPath.row])
        self.navigationController?.pushViewController(entryDetailView, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension EntryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EntryTableViewCell.identifier, for: indexPath) as? EntryTableViewCell ?? EntryTableViewCell()
        cell.setEntryCell(data: entryItems[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
