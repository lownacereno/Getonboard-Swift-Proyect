import UIKit

class CompanyViewPresenter{
    
    weak var delegate : CompanyPresenterProtocol?
    private var companyListUseCase : CompanyUseCase?
    
    init(companyList : CompanyUseCase) {
        self.companyListUseCase = companyList
    }
    
    
    func getCompanies(){
        self.companyListUseCase?.getCompanies( completionHandler: { [weak self] result in
            switch result{
            case let .success(model):
                self?.delegate?.presentCompanies(companies: model)
            case .failure:
                self?.delegate?.errorList()
            }
        })
    }
   
    public func setViewDelegate(delegate: CompanyPresenterProtocol){
        self.delegate = delegate
    }
}
