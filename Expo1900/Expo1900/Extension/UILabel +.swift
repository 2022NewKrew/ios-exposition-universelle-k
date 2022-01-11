//
//  UILabel+.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import Foundation
import UIKit

extension UILabel {
    static func make(with style: UIFont.TextStyle,
                     text: String = "",
                     textAlignment: NSTextAlignment = .center,
                     numberOfLines: Int = 0) -> UILabel {
        let label: UILabel = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: style)
        label.textColor = UIColor.black
        label.text = text
        label.adjustsFontForContentSizeCategory = true
        
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
