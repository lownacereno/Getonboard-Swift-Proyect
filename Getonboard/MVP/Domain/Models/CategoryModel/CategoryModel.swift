import Foundation

struct CategoryModel: Codable {
    let data: [DatumCategory]
}

struct DatumCategory: Codable {
    let id: String
    let attributes: Attributes
}

struct Attributes: Codable {
    let name: String
    let dimension: String
//    let title: String
//    let description: String
//    let logo: String
}

