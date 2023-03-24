import UIKit

class CompanyTableViewDataSource : NSObject{
    weak var viewController: CompanyViewController?
}

extension CompanyTableViewDataSource: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = viewController?.company?.data.count else {return 0}
        return model
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTableViewCell", for: indexPath) as? CompanyTableViewCell, let viewController = viewController, let model = viewController.company?.data[indexPath.row].attributes else {return UITableViewCell()}
        cell.setCellCompanyValue(model: model)
        return cell
    }
}


