//
//  UIImageView +.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/12.
//

import Foundation
import UIKit

extension UIImageView {
    convenience init(imageName: String = "", contentMode: UIView.ContentMode = .scaleToFill) {
        self.init()
        self.image = imageName.isEmpty ? UIImage() : UIImage(named: imageName)
        self.contentMode = contentMode
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
