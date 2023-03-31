import UIKit

protocol CategoryPresenterProtocol: AnyObject{
    func presentCategories(categories: [DataCategory])
    func goToDetail(indexPath: IndexPath)
    func showError()
}

