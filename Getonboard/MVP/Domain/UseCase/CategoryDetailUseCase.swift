import UIKit

final class CategoryDetailUseCase {
    
    func getCategoryDetail(id: String, completionHandler: @escaping (Result<[CategoryDetailData],Error>) -> Void) throws{
        
        guard let url = URL(string: "\(Endpoints.getJobList(id).fullPath)?per_page=100&page=1") else {
            throw NetworkError.invalidURL
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let categoriesDetail = try JSONDecoder().decode(CategoryDetailModel.self, from: data)
                    completionHandler(.success(categoriesDetail.data))
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
