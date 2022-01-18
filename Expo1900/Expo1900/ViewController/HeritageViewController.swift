//
//  HeritageViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/12.
//

import UIKit

class HeritageViewController: UIViewController {

    @IBOutlet weak var heritageImageView: UIImageView!
    @IBOutlet weak var heritageDescriptionTextView: UITextView!
    @IBOutlet weak var heritageScrollView: UIScrollView!
    @IBOutlet weak var heritageScrollContentView: UIView!
    
    var heritage: Heritage?
    lazy var portraitConstraints: [NSLayoutConstraint] = {
        return [heritageImageView.topAnchor.constraint(equalTo: heritageScrollContentView.topAnchor),
                heritageImageView.centerXAnchor.constraint(equalTo: heritageScrollContentView.centerXAnchor),
                heritageImageView.widthAnchor.constraint(lessThanOrEqualTo: heritageScrollContentView.widthAnchor, multiplier: 1),
                heritageDescriptionTextView.topAnchor.constraint(equalTo: heritageImageView.bottomAnchor, constant: 20),
                heritageDescriptionTextView.leadingAnchor.constraint(equalTo: heritageScrollContentView.leadingAnchor),
                heritageDescriptionTextView.trailingAnchor.constraint(equalTo: heritageScrollContentView.trailingAnchor),
                heritageDescriptionTextView.bottomAnchor.constraint(equalTo: heritageScrollContentView.bottomAnchor)
        ]
    }()
    
    lazy var landscapeConstraints: [NSLayoutConstraint] = {
        let frameLayout = heritageScrollView.frameLayoutGuide
        
        return [heritageImageView.heightAnchor.constraint(lessThanOrEqualTo: frameLayout.heightAnchor, multiplier: 1),
                heritageImageView.widthAnchor.constraint(lessThanOrEqualTo: frameLayout.widthAnchor, multiplier: 0.3),
                heritageImageView.leadingAnchor.constraint(equalTo: frameLayout.leadingAnchor),
                heritageImageView.centerYAnchor.constraint(equalTo: frameLayout.centerYAnchor),
                heritageDescriptionTextView.leadingAnchor.constraint(equalTo: heritageImageView.trailingAnchor, constant: 20),
                heritageDescriptionTextView.trailingAnchor.constraint(equalTo: heritageScrollContentView.trailingAnchor),
                heritageDescriptionTextView.topAnchor.constraint(equalTo: heritageScrollContentView.topAnchor),
                heritageDescriptionTextView.bottomAnchor.constraint(equalTo: heritageScrollContentView.bottomAnchor)
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = heritage?.name
        disableAutoresizingMasks()
        configureHeritageViews()
        configureHeritageImageViewRatioConstraint()
        switchConstraintsByOrientation()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        switchConstraintsByOrientation()
    }
    
    private func configureHeritageViews() {
        guard let heritage = heritage else { return }
        heritageImageView.image = UIImage(named: heritage.imageName)
        heritageDescriptionTextView.text = heritage.description
    }
    
    private func configureHeritageImageViewRatioConstraint() {
        guard let heritage = heritage ,let image = UIImage(named: heritage.imageName) else { return }
        let imageRatio = image.size.width / image.size.height
        heritageImageView.widthAnchor.constraint(equalTo: heritageImageView.heightAnchor, multiplier: imageRatio).isActive = true
    }
    
    private func disableAutoresizingMasks() {
        heritageImageView.translatesAutoresizingMaskIntoConstraints = false
        heritageDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func switchConstraintsByOrientation() {
        if UIDevice.current.orientation.isLandscape {
            NSLayoutConstraint.deactivate(portraitConstraints)
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            NSLayoutConstraint.deactivate(landscapeConstraints)
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
}
