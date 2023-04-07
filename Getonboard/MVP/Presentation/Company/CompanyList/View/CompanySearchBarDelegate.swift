import UIKit

extension CompanyViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCompany = company
        filteredCompany = searchText.isEmpty ? company : filteredCompany?.filter{$0.attributes.name.contains(searchText)}
        companyTableView.reloadData()
    }
}
