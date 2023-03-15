
import Foundation

struct AttributesModel: Codable {
    let name, description: String
    let web: String
    let country: String
    let logo: String

    enum CodingKeys: String, CodingKey {
        case name, description
        case web, country
        case logo
    }
}
