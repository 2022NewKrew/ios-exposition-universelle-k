//
//  Int+Extension.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import Foundation

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? "0"
    }
}
