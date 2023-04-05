import UIKit

final class CompanyUseCase {
    
    func getCompanies(completionHandler: @escaping (Result<[DataModel],Error>) -> Void) throws{
        
        guard let url = URL(string: "\(Endpoints.getCompanies.fullPath)?per_page=20&page=1") else {
            throw NetworkError.invalidURL
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let companies = try JSONDecoder().decode(CompanyModel.self, from: data)
                    completionHandler(.success(companies.data))
                }catch {
                    completionHandler(.failure(NetworkError.jsonDecoder))
                }
            }else if let error = error {
                completionHandler(.failure(error))
            }
        }
        task.resume()
    }
}
