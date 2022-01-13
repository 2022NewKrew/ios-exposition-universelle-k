//
//  UILabel+.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import Foundation
import UIKit

extension UILabel {    
    convenience init(with style: UIFont.TextStyle,
                     text: String = "",
                     textAlignment: NSTextAlignment = .center,
                     numberOfLines: Int = 0) {
        self.init()
        self.font = UIFont.preferredFont(forTextStyle: style)
        self.textColor = UIColor.black
        self.text = text
        self.adjustsFontForContentSizeCategory = true
        
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
