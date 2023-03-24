import XCTest
@testable import Getonboard

class TabBarControllerTest: XCTestCase{
    
    var sut : TabBarController!

    override func setUp() {
        super.setUp()
        sut = TabBarController()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testTabBarController() {
        let tabBarController = sut
        let viewController1 = CategoryViewController(dataSourceTable: CategoryTableViewDataSource(), delegateTable: CategoryTableViewDelegate())
        let viewController2 = CompanyViewController(dataSourceTable: CompanyTableViewDataSource(), delegateTable: CompanyTableViewDelegate())
        guard let tabBar = tabBarController else {return}
        
        tabBar.viewControllers = [viewController1, viewController2]
        XCTAssertNotNil(tabBar.view)
        tabBar.selectedIndex = 1
        XCTAssertTrue(tabBar.selectedViewController === viewController2)
    }
    
}

