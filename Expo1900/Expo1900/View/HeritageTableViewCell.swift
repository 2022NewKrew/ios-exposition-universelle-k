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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
