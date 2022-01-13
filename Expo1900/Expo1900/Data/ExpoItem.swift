//
//  ExpoItem.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/10.
//

import Foundation
import UIKit

struct ExpoItem: Codable {
    let name: String
    let imageName: String?
    let shortDesc: String
    let longDesc: String
    
    var image: UIImage? {
        guard let imageName: String = imageName else {
            assertionFailure()
            return nil
        }
        return UIImage(named: imageName)
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageName = "image_name"
        case shortDesc = "short_desc"
        case longDesc = "desc"
    }
}

