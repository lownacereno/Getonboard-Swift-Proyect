import XCTest
@testable import Getonboard

class CompanyTableViewDataSourceTest: XCTestCase {
    var sut: CompanyTableViewDataSource!
    var viewController : CompanyViewController!
    
    override func setUp() {
        super.setUp()
        sut = CompanyTableViewDataSource()
        viewController = CompanyViewController(dataSourceTable: sut, delegateTable: CompanyTableViewDelegate())
    }
    
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    func testNumberOfRowsInSectionZero(){
        sut.viewController = nil
        XCTAssertEqual(sut.tableView(viewController.companyTableView, numberOfRowsInSection: 0), 0)
    }
    
    func testNumberOfRowsInSection(){
        viewController.company = CompanyModel(data: [DataModel(attributes: AttributesModel(name: "Lowna", description: "hola", country: "CL", logo: "logo"))])
        XCTAssertEqual(sut.tableView(viewController.companyTableView, numberOfRowsInSection: 0), 1)
    }
    
    func testcellForRowAt(){
        viewController.company = CompanyModel(data: [DataModel(attributes: AttributesModel(name: "Lowna", description: "hola", country: "CL", logo: "logo"))])
        viewController.companyTableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: "CompanyTableViewCell")
        XCTAssertNotNil(sut.tableView(viewController.companyTableView, cellForRowAt: IndexPath(row: 0, section: 0)))
    }
    
    func testcellForRowAtReturnZero(){
        sut.viewController = nil
        viewController.companyTableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: "CompanyTableViewCell")
        XCTAssertNotNil(sut.tableView(viewController.companyTableView, cellForRowAt: IndexPath(row: 0, section: 0)))
    }
}
