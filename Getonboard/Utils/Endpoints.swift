import Foundation

enum Endpoints{
    
    private var baseURL : String { return "https://www.getonbrd.com"}
    case getCategories
    case getCompanies
    case getJobList(String)
    
    var fullPath: String {
        var endpoint : String
        switch self{
        case .getCompanies : endpoint = "/api/v0/companies"
        case .getCategories : endpoint = "/api/v0/categories"
        case .getJobList(let id) : endpoint = "/api/v0/categories/\(id)/jobs"
        }
        return baseURL + endpoint
    }
}
