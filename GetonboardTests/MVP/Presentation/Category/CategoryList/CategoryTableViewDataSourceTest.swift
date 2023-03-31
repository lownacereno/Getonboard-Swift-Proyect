import XCTest
@testable import Getonboard

class CategoryTableViewDataSourceTest: XCTestCase {
    var sut: CategoryTableViewDataSource!
    var viewController : CategoryViewController!
    
    override func setUp() {
        super.setUp()
        sut = CategoryTableViewDataSource()
        viewController = CategoryViewController(dataSourceTable: sut, delegateTable: CategoryTableViewDelegate())
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testNumberOfRowsInSectionZero(){
        sut.viewController = nil
        XCTAssertEqual(sut.tableView(viewController.categoryTableView, numberOfRowsInSection: 0), 0)
    }
    
    func testNumberOfRowsInSection(){
        viewController.categories = [DataCategory(id: "1", attributes: Attributes(name: "Pedro", dimension: "casa"))]
        XCTAssertEqual(sut.tableView(viewController.categoryTableView, numberOfRowsInSection: 0), 1)
    }
    
    func testcellForRowAt(){
        viewController.categories = [DataCategory(id: "1", attributes: Attributes(name: "Pedro", dimension: "casa"))]
        viewController.categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        XCTAssertNotNil(sut.tableView(viewController.categoryTableView, cellForRowAt: IndexPath(row: 0, section: 0)))
    }
    
    func testcellForRowAtReturnZero(){
        sut.viewController = nil
        viewController.categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "CategoryTableViewCell")
        XCTAssertNotNil(sut.tableView(viewController.categoryTableView, cellForRowAt: IndexPath(row: 0, section: 0)))
    }
}
