import UIKit

class CategoryDetailDelegate : NSObject{
    var viewController: CategoryDetailViewController?
}

extension CategoryDetailDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = viewController else {return}
        vc.goToDetail(indexPath: indexPath)
    }
}


