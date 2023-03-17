//
//  CategoryDetailModel.swift
//  Getonboard
//
//  Created by Lowna Letticia Cereño Franceschi on 17-03-23.
//

import Foundation

struct CategoryDetailModel: Codable {
    let data: [DataModel]
    let meta: Meta
}

// MARK: - Datum
struct DataModel: Codable {
    let id, type: String
    let attributes: DatumAttributes
    let links: Links
}

// MARK: - DatumAttributes
struct DatumAttributes: Codable {
    let title, descriptionHeadline, description, projects: String
    let functionsHeadline, functions, benefitsHeadline, benefits: String
    let desirableHeadline, desirable: String
    let remote: Bool
    let remoteModality, remoteZone, country, lang: String
    let categoryName: String
    let perks: [String]
    let minSalary, maxSalary, publishedAt: Int
    let responseTimeInDays: ResponseTimeInDays
    let applicationsCount: Int
    let tenantCity, modality, seniority: Ity
    let tags: Tags
    let company: Company

    enum CodingKeys: String, CodingKey {
        case title
        case descriptionHeadline = "description_headline"
        case description, projects
        case functionsHeadline = "functions_headline"
        case functions
        case benefitsHeadline = "benefits_headline"
        case benefits
        case desirableHeadline = "desirable_headline"
        case desirable, remote
        case remoteModality = "remote_modality"
        case remoteZone = "remote_zone"
        case country, lang
        case categoryName = "category_name"
        case perks
        case minSalary = "min_salary"
        case maxSalary = "max_salary"
        case publishedAt = "published_at"
        case responseTimeInDays = "response_time_in_days"
        case applicationsCount = "applications_count"
        case tenantCity = "tenant_city"
        case modality, seniority, tags, company
    }
}

// MARK: - Company
struct Company: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, type: String
    let attributes: DataAttributes
}

// MARK: - DataAttributes
struct DataAttributes: Codable {
    let name, description, longDescription, projects: String
    let benefits: String
    let web: String
    let twitter, github, facebook, angellist: String
    let country: String
    let responseTimeInDays: ResponseTimeInDays
    let logo: String

    enum CodingKeys: String, CodingKey {
        case name, description
        case longDescription = "long_description"
        case projects, benefits, web, twitter, github, facebook, angellist, country
        case responseTimeInDays = "response_time_in_days"
        case logo
    }
}

// MARK: - ResponseTimeInDays
struct ResponseTimeInDays: Codable {
    let min, max: Int?
}

// MARK: - Ity
struct Ity: Codable {
    let data: DAT
}

// MARK: - DAT
struct DAT: Codable {
    let id: Int
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case modality = "modality"
    case seniority = "seniority"
    case tag = "tag"
    case tenantCity = "tenant_city"
}

// MARK: - Tags
struct Tags: Codable {
    let data: [DAT]
}

// MARK: - Links
struct Links: Codable {
    let publicURL: String

    enum CodingKeys: String, CodingKey {
        case publicURL = "public_url"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let page, perPage, totalPages: Int

    enum CodingKeys: String, CodingKey {
        case page
        case perPage = "per_page"
        case totalPages = "total_pages"
    }
}
