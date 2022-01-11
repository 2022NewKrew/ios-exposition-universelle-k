//
//  PosterViewController.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/11.
//

import UIKit

class PosterViewController: UIViewController {
    // MARK: - Views
    private lazy var titleLabel: UILabel = UILabel.make(with: .title1)
    
    private lazy var posterImageView: UIImageView = makeImageView(imageName: "poster")
    
    private lazy var visitorStaticLabel: UILabel = UILabel.make(with: .title3,
                                                                text: "방문객",
                                                                textAlignment: .right)
    private lazy var locationStaticLabel: UILabel = UILabel.make(with: .title3,
                                                                 text: "개최지",
                                                                 textAlignment: .right)
    private lazy var durationStaticLabel: UILabel = UILabel.make(with: .title3,
                                                                 text: "개최 기간",
                                                                 textAlignment: .right)
    
    private lazy var visitorLabel: UILabel = UILabel.make(with: .body,
                                                          textAlignment: .left,
                                                          numberOfLines: 1)
    private lazy var locationLabel: UILabel = UILabel.make(with: .body, numberOfLines: 1)
    private lazy var durationLabel: UILabel = UILabel.make(with: .body, numberOfLines: 1)
    
    private lazy var visitorStackView: UIStackView = makeHorizontalStackView(with: visitorStaticLabel,
                                                                             visitorLabel,
                                                                             spacing: 5)
    private lazy var locationStackView: UIStackView = makeHorizontalStackView(with: locationStaticLabel,
                                                                              locationLabel,
                                                                              spacing: 5)
    private lazy var durationStackView: UIStackView = makeHorizontalStackView(with: durationStaticLabel,
                                                                              durationLabel,
                                                                              spacing: 5)
    
    private lazy var descriptionLabel: UILabel = UILabel.make(with: .body, textAlignment: .left)
    
    private lazy var leftFlagImageView: UIImageView = makeImageView(imageName: "flag")
    private lazy var rightFlagImageView: UIImageView = makeImageView(imageName: "flag")
    
    private lazy var showExpoButton: UIButton = {
        let button: UIButton = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showExpoListViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = makeHorizontalStackView(with: leftFlagImageView,
                                                                            showExpoButton,
                                                                            rightFlagImageView,
                                                                            spacing: 20)
    
    private lazy var contentStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [titleLabel, posterImageView,
                                                                    visitorStackView, locationStackView,
                                                                    durationStackView, descriptionLabel,
                                                                    buttonStackView])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 7
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.addSubview(contentStackView)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "메인"
        view.backgroundColor = UIColor.white
        setupScrollView()
        bindExpositionModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }
    
    private func makeHorizontalStackView(with subviews: UIView..., spacing: CGFloat) -> UIStackView {
        let stackView: UIStackView = UIStackView(arrangedSubviews: subviews)
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = spacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func makeImageView(imageName: String) -> UIImageView {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    // MARK: - Setup
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -25),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        setupImageViews()
    }
    
    private func setupImageViews() {
        let safeArea: UILayoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            posterImageView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.4),
            posterImageView.heightAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.6),
            leftFlagImageView.heightAnchor.constraint(equalToConstant: 20),
            leftFlagImageView.widthAnchor.constraint(equalToConstant: 20),
            rightFlagImageView.heightAnchor.constraint(equalToConstant: 20),
            rightFlagImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func bindExpositionModel() {
        guard let jsonData: Data = FileLoader.shared.readFile(fileName: "exposition_universelle_1900", extensionType: "json") else {
            return
        }
        
        let model: Exposition? = JSONParser.shared.decode(Exposition.self, from: jsonData)
        guard let model = model else {
            return
        }
        
        titleLabel.text = model.title
        visitorLabel.text = ": \(model.visitors)"
        locationLabel.text = ": \(model.location)"
        durationLabel.text = ": \(model.duration)"
        descriptionLabel.text = "\(model.description)"
    }
    
    private func hideNavigationBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    @objc
    func showExpoListViewController() {
        let expoListVC: ExpoListViewController = ExpoListViewController()
        navigationController?.pushViewController(expoListVC, animated: true)
    }
}
