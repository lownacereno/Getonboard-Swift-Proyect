import Foundation

struct CategoryDetailModel: Codable {
    let data: [Datum]
}

struct Datum: Codable {
    let id, type: String
    let attributes: DatumAttributes
}

struct DatumAttributes: Codable {
    let title, descriptionHeadline, description, projects: String
   
    enum CodingKeys: String, CodingKey {
        case title
        case descriptionHeadline = "description_headline"
        case description, projects
    }
}
