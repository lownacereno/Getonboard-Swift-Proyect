import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = AppColors.blueCustomColor
        self.navigationItem.setHidesBackButton(true, animated: true)
        tabBar.isTranslucent = true
        tabBar.tintColor = .red
        setupTabBar()
    }
    
    private func setupTabBar() {
        let categoryvc = UINavigationController(rootViewController: CategoryViewController(dataSourceTable: CategoryTableViewDataSource(), delegateTable: CategoryTableViewDelegate()))
        let companyVC = UINavigationController(rootViewController: CompanyViewController(dataSourceTable: CompanyTableViewDataSource(), delegateTable: CompanyTableViewDelegate()))
        categoryvc.title = "Categorías"
        companyVC.title = "Compañías"
        categoryvc.tabBarItem.image = UIImage(systemName: "square.fill.text.grid.1x2")
        companyVC.tabBarItem.image = UIImage(systemName: "building.2.crop.circle")
        setViewControllers([categoryvc, companyVC], animated: true)
    }
}
