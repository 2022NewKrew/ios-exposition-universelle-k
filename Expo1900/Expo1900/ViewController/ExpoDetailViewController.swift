//
//  ExpoDetailViewController.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/12.
//

import UIKit

class ExpoDetailViewController: UIViewController {
    // MARK: - Views
    private let expoImageView: UIImageView = UIImageView.make()
    private let descLabel: UILabel = UILabel.make(with: .body, textAlignment: .left)
    
    private lazy var contentStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [expoImageView, descLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - Properties
    private let expoItem: ExpoItem
    
    // MARK: - Initializer
    init(expoItem: ExpoItem) {
        self.expoItem = expoItem
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        bindExpoItem()
    }
    
    // MARK: - Setup
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -24),
            contentStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
    }
    
    private func bindExpoItem() {
        title = expoItem.name
        expoImageView.image = expoItem.image
        descLabel.text = expoItem.longDesc
    }
}
