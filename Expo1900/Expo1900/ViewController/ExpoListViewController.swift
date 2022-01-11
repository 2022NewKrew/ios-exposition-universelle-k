//
//  ExpoListViewController.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/11.
//

import UIKit

class ExpoListViewController: UIViewController {
    private let expoTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.register(ExpoTableViewCell.self, forCellReuseIdentifier: ExpoTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var expoItems: [ExpoItem] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "한국의 출품작"
        view.backgroundColor = .white
        setupExpoTableView()
        bindExpoItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar()
    }
    
    private func showNavigationBar() {
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupExpoTableView() {
        view.addSubview(expoTableView)
        
        NSLayoutConstraint.activate([expoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     expoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     expoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     expoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        expoTableView.dataSource = self
    }
    
    private func bindExpoItems() {
        guard let jsonData: Data = FileLoader.shared.readFile(fileName: "items", extensionType: "json"),
              let model: [ExpoItem] = JSONParser.shared.decode([ExpoItem].self, from: jsonData) else {
            return
        }
        
        expoItems = model
        expoTableView.reloadData()
    }
}

extension ExpoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ExpoTableViewCell = tableView.dequeueReusableCell(withIdentifier: ExpoTableViewCell.identifier, for: indexPath) as? ExpoTableViewCell else {
            fatalError("no ExpoTableViewCell")
        }
        let expoItem: ExpoItem = expoItems[indexPath.row]
        cell.updateView(by: expoItem)
        return cell
    }
}
