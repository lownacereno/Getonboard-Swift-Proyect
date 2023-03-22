import Foundation

@testable import Getonboard
import UIKit

class NavigationDetailMock: CompanyPresenterProtocol{
    var success = false
    
    func goToDetail(indexPath: IndexPath){
        success = true
    }
    
    func presentCompanies(companies: Getonboard.CompanyModel) {
    }
}
