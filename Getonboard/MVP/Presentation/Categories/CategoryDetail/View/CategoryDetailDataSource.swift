import UIKit

class CategoryDetailDataSource : NSObject{
    weak var viewController: CategoryDetailViewController?
}

extension CategoryDetailDataSource: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.workOffers?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryDetailTableViewCell", for: indexPath) as? CategoryDetailTableViewCell, let model = viewController?.workOffers?.data[indexPath.row].attributes else {return UITableViewCell()}
        cell.setCellValue(model: model)
        return cell
    }}

