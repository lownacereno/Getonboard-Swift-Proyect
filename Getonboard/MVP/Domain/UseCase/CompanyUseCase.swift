import UIKit

final class CompanyUseCase {
    
    func getCompanies(completionHandler: @escaping (Result<[DataModel],Error>) -> Void){
    
        guard let url = URL(string: "https://www.getonbrd.com/api/v0/companies?per_page=20&page=1") else {
            completionHandler(.failure(ErrorCustom.url))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let companies = try? JSONDecoder().decode(CompanyModel.self, from: data) {
                    completionHandler(.success(companies.data))
                }else {
                    completionHandler(.failure(ErrorCustom.jSONDecoder))
                }
            }else if let error = error {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
}


