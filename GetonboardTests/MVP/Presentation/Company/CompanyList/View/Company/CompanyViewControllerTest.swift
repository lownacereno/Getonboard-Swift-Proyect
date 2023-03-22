import XCTest
@testable import Getonboard

class CompanyViewControllerTest: XCTestCase {
    var sut: CompanyViewController!
    
    override func setUp() {
        super.setUp()
        sut = CompanyViewController(dataSourceTable: CompanyTableViewDataSource(), delegateTable: CompanyTableViewDelegate())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testNumberOfRowsInSection() {
        let section = 0 // la sección que quieres probar
        guard let expectedRows = sut.company?.data.count else {return}// el número de filas que esperas
        
        guard let actualRows = sut.companyTableView.dataSource?.tableView(sut.companyTableView, numberOfRowsInSection: section) else {return}
        
        XCTAssertEqual(actualRows, expectedRows)
    }
}
