import Foundation

struct CategoryDetailModel: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let id: String
    let attributes: DatumAttributes
}

struct DatumAttributes: Codable {
    let title, description: String
   
    enum CodingKeys: String, CodingKey {
        case title
        case description
    }
}
