import Foundation
import UIKit

class Decoder {
    static func decodeEntry<T: Decodable> (type: T.Type, from: String) -> T? {
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
