//
//  ExpoDetailViewController.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/12.
//

import UIKit

class ExpoDetailViewController: UIViewController {
    // MARK: - Views
    private let expoImageView: UIImageView = UIImageView(contentMode: .scaleAspectFit)
    private let descLabel: UILabel = UILabel(with: .body, textAlignment: .left)
    
    private lazy var contentStackView: UIStackView = UIStackView(views: [expoImageView,
                                                                         descLabel],
                                                                 axis: .vertical,
                                                                 spacing: 10)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var outerStackView: UIStackView = UIStackView(views: [scrollView],
                                                               axis: .horizontal,
                                                               spacing: 20)
    
    private var expoImageLandscapeWidthConstraint: NSLayoutConstraint = NSLayoutConstraint()
    
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
        setupExpoImageView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleOrientationLayout), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        handleOrientationLayout()
    }
    
    // MARK: - Setup
    private func setupScrollView() {
        view.addSubview(outerStackView)
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            outerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            outerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 12),
            outerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: outerStackView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: outerStackView.bottomAnchor),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -12),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -12),
            descLabel.widthAnchor.constraint(equalTo: contentStackView.widthAnchor)
        ])
    }
    
    private func bindExpoItem() {
        title = expoItem.name
        expoImageView.image = expoItem.image
        descLabel.text = expoItem.longDesc
    }
    
    private func setupExpoImageView() {
        let imageWidth: CGFloat = expoImageView.intrinsicContentSize.width
        let imageHeight: CGFloat = expoImageView.intrinsicContentSize.height
        let imageRatio: CGFloat = imageHeight / imageWidth
        
        expoImageView.heightAnchor.constraint(equalTo: expoImageView.widthAnchor, multiplier: imageRatio).isActive = true
        expoImageLandscapeWidthConstraint = expoImageView.widthAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3)
    }
    
    @objc
    func handleOrientationLayout() {
        if UIDevice.current.orientation.isLandscape {
            expoImageView.removeFromSuperview()
            outerStackView.insertArrangedSubview(expoImageView, at: 0)
            expoImageLandscapeWidthConstraint.isActive = true
            view.layoutIfNeeded()
        } else if UIDevice.current.orientation.isPortrait {
            expoImageView.removeFromSuperview()
            contentStackView.insertArrangedSubview(expoImageView, at: 0)
            expoImageLandscapeWidthConstraint.isActive = false
            view.layoutIfNeeded()
        }
    }
}
