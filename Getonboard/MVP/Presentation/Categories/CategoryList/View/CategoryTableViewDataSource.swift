import UIKit

class CategoryTableViewDataSource : NSObject{
    weak var viewController: CategoryViewController?
}

extension CategoryTableViewDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let model = viewController?.categories?.count else {return 0}
        return model
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell, let viewController = viewController, let model = viewController.categories?[indexPath.row].attributes else {return UITableViewCell()}
        cell.setCellCategoryValue(model: model)
        return cell
    }
}

