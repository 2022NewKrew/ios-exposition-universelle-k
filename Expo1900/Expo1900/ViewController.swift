import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    

    
    var entryItems: [EntryData] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        entryItems = Decoder.decodeEntry(type: [EntryData].self, from: "items") ?? entryItems
        
        
        
    }
    

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let entry = entryItems[indexPath.row]
        cell.textLabel?.text = entry.name
        cell.imageView?.image = UIImage(named: entry.image)
        return cell
    }
}
