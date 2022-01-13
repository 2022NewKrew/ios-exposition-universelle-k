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
    
    var heritage: Heritage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = heritage?.name
        configureHeritageViews()
        configureHeritageImageViewRatioConstraint()
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
}
