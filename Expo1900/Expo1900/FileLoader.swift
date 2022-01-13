//
//  FileLoader.swift
//  Expo1900
//
//  Created by Jinwook Huh on 2022/01/10.
//

import Foundation
import UIKit

class FileLoader {
    static let shared: FileLoader = FileLoader()
    
    private init() {}
    
    func readFile(fileName: String, extensionType: String) -> Data? {
        guard let fileURL: URL = Bundle.main.url(forResource: fileName, withExtension: extensionType) else {
            assertionFailure()
            return nil
        }
        do {
            let data: Data = try Data(contentsOf: fileURL)
            return data
        } catch {
            assertionFailure()
            return nil
        }
    }
    
    func readDataSet(fileName: String) -> Data? {
        guard let asset: NSDataAsset = NSDataAsset(name: "items") else {
            assertionFailure()
            return nil
        }
        return asset.data
    }
}
