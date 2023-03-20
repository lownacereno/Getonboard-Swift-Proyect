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

struct CompanyClass: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let id, type: String
    let attributes: DataAttributes
}

struct DataAttributes: Codable {
    let name, description, longDescription, projects: String
    let benefits: String
    let web: String
    let twitter, github, facebook, angellist: String
    let country: String
    let logo: String

    enum CodingKeys: String, CodingKey {
        case name, description
        case longDescription = "long_description"
        case projects, benefits, web, twitter, github, facebook, angellist, country
        case logo
    }
}

enum TypeEnum: String, Codable {
    case modality = "modality"
    case seniority = "seniority"
    case tag = "tag"
    case tenantCity = "tenant_city"
}
