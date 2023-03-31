import UIKit

final class CategoryListUseCase {
    
    func getCategories(completionHandler: @escaping (Result<[DataCategory],Error>) -> Void) throws{
        
        guard let url = URL(string: "https://www.getonbrd.com/api/v0/categories?per_page=100&page=1") else {
            throw NetworkError.invalidURL
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let categories = try JSONDecoder().decode(CategoryModel.self, from: data)
                    completionHandler(.success(categories.data))
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
