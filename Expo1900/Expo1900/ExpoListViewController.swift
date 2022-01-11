//
//  ExpoListViewController.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/11.
//

import UIKit

class ExpoListViewController: UIViewController {
    let expoTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "한국의 출품작"
        view.backgroundColor = .white
        setupExpoTableView()
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
    }
}
