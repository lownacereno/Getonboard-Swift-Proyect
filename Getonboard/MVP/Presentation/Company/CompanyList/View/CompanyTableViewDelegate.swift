import UIKit

class CompanyTableViewDelegate : NSObject{
    var viewController: CompanyPresenterProtocol?
}

extension CompanyTableViewDelegate: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = viewController else { return }
        vc.goToDetail(indexPath: indexPath)
    }
}
