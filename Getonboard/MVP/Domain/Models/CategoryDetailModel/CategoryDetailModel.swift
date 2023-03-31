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
    
}
