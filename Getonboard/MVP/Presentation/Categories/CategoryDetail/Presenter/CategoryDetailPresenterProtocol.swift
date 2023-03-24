import UIKit

protocol CategoryDetailPresenterProtocol: AnyObject{
    func presentCategoryDetail(categoryDetail: CategoryDetailModel)
    func goToDetail(indexPath: IndexPath)
}
