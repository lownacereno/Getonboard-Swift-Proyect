import XCTest
@testable import Getonboard

class CategoryDetailTableViewDataSourceTest: XCTestCase {
    var sut: CategoryDetailTableViewDataSource!
    var viewController : CategoryDetailViewController!
    
    override func setUp() {
        super.setUp()
        sut = CategoryDetailTableViewDataSource()
        viewController = CategoryDetailViewController(dataSourceTable: sut, delegateTable: CategoryDetailTableViewDelegate())
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testNumberOfRowsInSectionZero(){
        sut.viewController = nil
        XCTAssertEqual(sut.tableView(viewController.jobListTableView, numberOfRowsInSection: 0), 0)
    }
    
    func testNumberOfRowsInSection(){
        viewController.workOffers = [CategoryDetailData(id: "1", attributes: DatumAttributes(title: "Hola", description: "mundo"))]
        XCTAssertEqual(sut.tableView(viewController.jobListTableView, numberOfRowsInSection: 0), 1)
    }
    
    func testcellForRowAt(){
        viewController.workOffers = [CategoryDetailData(id: "1", attributes: DatumAttributes(title: "Hola", description: "mundo"))]
        viewController.jobListTableView.register(CategoryDetailTableViewCell.self, forCellReuseIdentifier: "CategoryDetailTableViewCell")
        XCTAssertNotNil(sut.tableView(viewController.jobListTableView, cellForRowAt: IndexPath(row: 0, section: 0)))
    }
    
    func testcellForRowAtReturnZero(){
        sut.viewController = nil
        viewController.jobListTableView.register(CategoryDetailTableViewCell.self, forCellReuseIdentifier: "CategoryDetailTableViewCell")
        XCTAssertNotNil(sut.tableView(viewController.jobListTableView, cellForRowAt: IndexPath(row: 0, section: 0)))
    }
}
