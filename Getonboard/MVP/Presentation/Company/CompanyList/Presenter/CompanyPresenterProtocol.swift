import UIKit

protocol CompanyPresenterProtocol: AnyObject{
    func presentCompanies(companies: CompanyModel)
    func goToDetail(indexPath: IndexPath)
}

