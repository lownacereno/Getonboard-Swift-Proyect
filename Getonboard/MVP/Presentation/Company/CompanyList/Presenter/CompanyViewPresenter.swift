import UIKit

class CompanyViewPresenter{
    
    weak var delegate : CompanyPresenterProtocol?
    
    public func getCompanies(){
        guard let url = URL(string: "https://www.getonbrd.com/api/v0/companies?per_page=10&page=1") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let companies = try JSONDecoder().decode(CompanyModel.self, from: data)
                self?.delegate?.presentCompanies(companies: companies)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
   
    public func setViewDelegate(delegate: CompanyPresenterProtocol){
        self.delegate = delegate
    }
}
