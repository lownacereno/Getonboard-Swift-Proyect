import UIKit

class CategoryTableViewDataSource : NSObject{
    weak var viewController: CategoryViewController?
}

extension CategoryTableViewDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewController?.categories?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell, let viewController = viewController, let model = viewController.categories?.data[indexPath.row].attributes else {return UITableViewCell()}
        cell.setCellCategoryValue(model: model)
        return cell
    }
}

