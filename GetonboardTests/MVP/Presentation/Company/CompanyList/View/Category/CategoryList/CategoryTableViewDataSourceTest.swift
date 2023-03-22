import XCTest
@testable import Getonboard

class CategoryViewControllerTest: XCTestCase {
    var sut: CategoryViewController!

    override func setUp() {
        super.setUp()
        sut = CategoryViewController(dataSourceTable: CategoryTableViewDataSource(), delegateTable: CategoryTableViewDelegate())
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNumberOfRowsInSection() {
        let section = 0 // la sección que quieres probar
        guard let expectedRows = sut.categories?.data.count else {return}// el número de filas que esperas

        guard let actualRows = sut.categoryTableView.dataSource?.tableView(sut.categoryTableView, numberOfRowsInSection: section) else {return}

        XCTAssertEqual(actualRows, expectedRows)
    }
}
