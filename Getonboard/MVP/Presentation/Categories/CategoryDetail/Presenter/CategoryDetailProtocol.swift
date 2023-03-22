import UIKit

protocol CategoryDetailProtocol: AnyObject{
    func presentCategoryDetail(categoryDetail: CategoryDetailModel)
    func goToDetail(indexPath: IndexPath)
    
}