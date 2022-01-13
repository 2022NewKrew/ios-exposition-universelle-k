//
//  HeritageTableViewCell.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class HeritageTableViewCell: UITableViewCell {

    @IBOutlet weak var heritageImageView: UIImageView!
    @IBOutlet weak var heritageTitleLabel: UILabel!
    @IBOutlet weak var heritageShortDescriptionLabel: UILabel!
    
    func configureWithHeritage(_ heritage: Heritage) {
        heritageImageView.image = UIImage(named: heritage.imageName)
        heritageTitleLabel.text = heritage.name
        heritageShortDescriptionLabel.text = heritage.shortDescription
    }
}
