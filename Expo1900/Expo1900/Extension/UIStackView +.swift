//
//  UIStackView +.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/13.
//

import UIKit

extension UIStackView {
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis = .horizontal, alignment: UIStackView.Alignment = .center, distribution: UIStackView.Distribution = .fill, spacing: CGFloat = 0) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.alignment = alignment
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
