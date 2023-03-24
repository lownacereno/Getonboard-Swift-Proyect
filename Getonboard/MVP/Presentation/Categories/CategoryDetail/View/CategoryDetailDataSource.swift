import UIKit

class CategoryDetailDataSource : NSObject{
    weak var viewController: CategoryDetailViewController?
}

extension CategoryDetailDataSource: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = viewController?.workOffers?.data.count else {return 0}
        return model
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryDetailTableViewCell", for: indexPath) as? CategoryDetailTableViewCell, let model = viewController?.workOffers?.data[indexPath.row].attributes else {return UITableViewCell()}
        cell.setCellValue(model: model)
        return cell
    }}

