import Foundation

struct CategoryDetailModel: Codable {
    let data: [CategoryDetailData]
}

struct CategoryDetailData: Codable {
    let id: String
    let attributes: DatumAttributes
}

struct DatumAttributes: Codable {
    let title, description: String
    let publishedAt: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case publishedAt = "published_at"
    }
    
}
