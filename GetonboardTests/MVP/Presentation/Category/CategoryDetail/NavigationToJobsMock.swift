import Foundation

@testable import Getonboard
import UIKit

class NavigationToJobsMock: CategoryDetailPresenterProtocol{
    
    var success = false
    
    func goToDetail(indexPath: IndexPath) {
        success = true
    }
    
    func presentCategoryDetail(categoryDetail: [CategoryDetailData]) {}
    
    func showError() {}
}

