import Foundation

struct EntryData: Decodable{
    let name: String
    let image: String
    let shortDescription: String
    let detailDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case image = "image_name"
        case shortDescription = "short_desc"
        case detailDescription = "desc"
    }
}
