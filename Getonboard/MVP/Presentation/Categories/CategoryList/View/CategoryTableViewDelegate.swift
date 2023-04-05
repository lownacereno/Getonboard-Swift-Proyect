import UIKit

class CategoryTableViewDelegate : NSObject{
    var viewController: CategoryPresenterProtocol?
}

extension CategoryTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = viewController else {return}
        vc.goToDetail(indexPath: indexPath)
    }
}
