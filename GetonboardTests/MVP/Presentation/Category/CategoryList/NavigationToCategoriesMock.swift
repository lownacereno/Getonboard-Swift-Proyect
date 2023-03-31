
import Foundation

@testable import Getonboard
import UIKit

class NavigationToCategoriesMock: CategoryPresenterProtocol{
   
    var success = false
    
    func goToDetail(indexPath: IndexPath){
        success = true
    }
    
    func presentCategories(categories: [DataCategory]) {}
    
    func showError() {}
}
