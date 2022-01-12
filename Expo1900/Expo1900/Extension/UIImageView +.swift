//
//  UIImageView +.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/12.
//

import Foundation
import UIKit

extension UIImageView {
    static func make(imageName: String = "", contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImageView {
        let imageView: UIImageView = UIImageView()
        imageView.image = imageName.isEmpty ? UIImage() : UIImage(named: imageName)
        imageView.contentMode = contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
