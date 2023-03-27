import Foundation

struct CategoryDetailModel: Codable {
    let data: [Data]
}

struct Data: Codable {
    let id: String
    let attributes: DatumAttributes
}

struct DatumAttributes: Codable {
    let title, description: String
   
}
