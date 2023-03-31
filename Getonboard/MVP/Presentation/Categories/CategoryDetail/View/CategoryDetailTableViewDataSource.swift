import UIKit

class CategoryDetailTableViewDataSource : NSObject{
    weak var viewController: CategoryDetailViewController?
}

extension CategoryDetailTableViewDataSource: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = viewController?.workOffers?.count else {return 0}
        return model
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryDetailTableViewCell", for: indexPath) as? CategoryDetailTableViewCell, let model = viewController?.workOffers?[indexPath.row].attributes else {return UITableViewCell()}
        cell.setCellValue(model: model)
        return cell
    }}

