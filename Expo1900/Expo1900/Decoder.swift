//
//  Decoder.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import Foundation
import UIKit

class Decoder {
    static func decodeEntry<T: Codable> (type: T.Type, from: String) -> T? {
        guard let items = NSDataAsset.init(name: from) else {
            return nil
        }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(type, from: items.data)
        } catch {
            print(error)
        }
        return nil
    }
}
