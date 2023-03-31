import UIKit

class CompanyViewPresenter{
    
    private var delegate : CompanyPresenterProtocol?
    private let companyListUseCase : CompanyUseCase?
    
    init(companyList : CompanyUseCase) {
        self.companyListUseCase = companyList
    }
    
    func getCompanies(){
        do {try self.companyListUseCase?.getCompanies( completionHandler: { [weak self] result in
            switch result{
            case let .success(model):
                self?.delegate?.presentCompanies(companies: model)
            case .failure:
                self?.delegate?.showError()
            }
        })
        }
        catch{
            print(error)
        }
    }
    
    public func setViewDelegate(delegate: CompanyPresenterProtocol){
        self.delegate = delegate
    }
}
