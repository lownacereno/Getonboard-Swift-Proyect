import UIKit

class CategoryDetailPresenter{
    
    weak var delegate : CategoryDetailProtocol?
    
    public func getCategoryDetail(id: String){
        guard let url = URL(string: "https://www.getonbrd.com/api/v0/categories/\(id)/jobs?per_page=100&page=1") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let companies = try JSONDecoder().decode(CategoryDetailModel.self, from: data)
                self?.delegate?.presentCategoryDetail(categoryDetail: companies)
                print(companies.data.count)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate: CategoryDetailProtocol){
        self.delegate = delegate
    }
}
