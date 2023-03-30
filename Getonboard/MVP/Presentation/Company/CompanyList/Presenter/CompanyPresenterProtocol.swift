import UIKit

protocol CompanyPresenterProtocol: AnyObject{
    func presentCompanies(companies: [DataModel])
    func goToDetail(indexPath: IndexPath)
    func errorList()
}

