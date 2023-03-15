import UIKit

class CompanyTableViewDataSource : NSObject{
    weak var viewController: CompanyViewController?
}

extension CompanyTableViewDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewController?.company?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTableViewCell", for: indexPath) as? CompanyTableViewCell, let viewController = viewController else {return UITableViewCell()}
        cell.setCellCompanyValue(model: (viewController.company?.data[indexPath.row].attributes)!)
        return cell
    }
}


