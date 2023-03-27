import Foundation

struct CategoryModel: Codable {
    let data: [DataCategory]
}

struct DataCategory: Codable {
    let id: String
    let attributes: Attributes
}

struct Attributes: Codable {
    let name: String
    let dimension: String
}

