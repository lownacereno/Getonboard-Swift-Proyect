import UIKit

class CategoryDetailTableViewDelegate : NSObject{
    var viewController: CategoryDetailPresenterProtocol?
}

extension CategoryDetailTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = viewController else {return}
        vc.goToDetail(indexPath: indexPath)
    }
}


