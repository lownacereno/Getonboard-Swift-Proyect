import UIKit

class CategoryViewPresenter{
    
    weak var delegate : CategoryPresenterProtocol?
    
    public func getCategories(){
        guard let url = URL(string: "https://www.getonbrd.com/api/v0/categories?per_page=100&page=1") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let categories = try JSONDecoder().decode(CategoryModel.self, from: data)
                self?.delegate?.presentCategories(categories: categories)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
   
    public func setViewDelegate(delegate: CategoryPresenterProtocol){
        self.delegate = delegate
    }
}
