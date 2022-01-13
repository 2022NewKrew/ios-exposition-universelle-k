//
//  Exposition.swift
//  Expo1900
//
//  Created by kakao on 2022/01/10.
//

import Foundation
import UIKit.UIImage

struct Exposition: Codable {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
    
    var visitorsCount: String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return (numberFormatter.string(from: NSNumber(value: visitors)) ?? "0") + " 명"
    }
    
    var image: UIImage? {
        let posterImageName: String = "poster"
        guard let image: UIImage = UIImage(named: posterImageName) else {
            assertionFailure()
            return nil
        }
        return image
    }
}
