import UIKit

protocol CategoryPresenterProtocol: AnyObject{
    func presentCategories(categories: CategoryModel)
    func goToDetail(indexPath: IndexPath)
}

