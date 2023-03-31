import UIKit

protocol CategoryDetailPresenterProtocol: AnyObject{
    func presentCategoryDetail(categoryDetail: [CategoryDetailData])
    func goToDetail(indexPath: IndexPath)
    func showError()
}
