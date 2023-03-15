import UIKit

protocol CompanyPresenterDelegateProtocol: AnyObject{
    func presentCompanies(companies: CompanyModel)
}

typealias PresenterDelegate = CompanyPresenterDelegateProtocol & UIViewController
