import Foundation

struct CategoryModel: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let attributes: Attributes
}

struct Attributes: Codable {
    let name: String
//    let title: String
//    let description: String
//    let logo: String
}

