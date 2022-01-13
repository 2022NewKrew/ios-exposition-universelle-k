//
//  HeritageTableViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class HeritageTableViewController: UITableViewController {
    
    private let cellIdentifier = "heritageCell"
    private lazy var heritages: [Heritage] = {
        do {
            return try JsonParser.shared.fetchData(from: .expo1900Items)
        } catch {
            print(error.localizedDescription)
            let alert = UIAlertController(title: "에러 발생", message: error.localizedDescription, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "확인", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            return []
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heritages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HeritageTableViewCell else {
            fatalError("No matched reusable cell!")
        }
        let heritage = heritages[indexPath.row]
        cell.configureWithHeritage(heritage)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "heritageViewController") as? HeritageViewController else { return }
        detailViewController.heritage = heritages[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
