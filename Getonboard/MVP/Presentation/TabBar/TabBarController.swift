import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .systemBackground
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupTabBar()
    }
    
    private func setupTabBar() {
        let categoryvc = UINavigationController(rootViewController: CategoriesViewController())
        let companyVC = UINavigationController(rootViewController: CompanyViewController(dataSourceTable: CompanyTableViewDataSource(), delegateTable: CompanyTableViewDelegate()))
        categoryvc.tabBarItem.image = UIImage(systemName: "square.fill.text.grid.1x2")
        companyVC.tabBarItem.image = UIImage(systemName: "building.2.crop.circle")
        setViewControllers([categoryvc, companyVC], animated: true)
    }
}
