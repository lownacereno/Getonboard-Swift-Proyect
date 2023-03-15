import UIKit

class CompanyTableViewDelegate : NSObject{
     var viewController: CompanyViewController?
}

extension CompanyTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

