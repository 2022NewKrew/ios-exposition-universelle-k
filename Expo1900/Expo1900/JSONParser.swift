//
//  JSONParser.swift
//  Expo1900
//
//  Created by kakao on 2022/01/10.
//

import Foundation

class JSONParser {
    static let shared: JSONParser = JSONParser()
    
    private init() {}
    
    func decode<T: Codable>(_ modelType: T.Type, from data: Data) -> T? {
        do {
            return try JSONDecoder().decode(modelType, from: data)
        } catch {
            assertionFailure()
            print(error.localizedDescription)
            return nil
        }
    }
}
