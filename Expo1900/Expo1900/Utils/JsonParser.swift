//
//  DataManager.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class JsonParser {
    static let shared = JsonParser()
    
    private let jsonDecoder = JSONDecoder()
    
    private init() { }
    
    func fetchData<T: Decodable>(from fileName: JsonFileList) throws -> T {
        guard let assetData = NSDataAsset(name: fileName.rawValue)?.data else {
            throw JsonParserError.noMatchedAssetName(fileName: fileName.rawValue)
        }
        let fetchedData = try jsonDecoder.decode(T.self, from: assetData)
        return fetchedData
    }
    
    enum JsonFileList: String {
        case expo1900 = "expo_1900"
        case expo1900Items = "expo_1900_items"
    }
}

enum JsonParserError: Error {
    case noMatchedAssetName(fileName: String)
}

extension JsonParserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noMatchedAssetName(fileName: let name):
            return "\(name) file doesn't exist"
        }
    }
}


