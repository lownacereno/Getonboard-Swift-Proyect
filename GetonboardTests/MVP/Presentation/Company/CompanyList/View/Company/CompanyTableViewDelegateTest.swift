import XCTest
@testable import Getonboard

class CompanyTableViewDelegateTest: XCTestCase{
    
    var sut : CompanyTableViewDelegate!
    var mock : NavigationDetailMock!
    
    override func setUp() {
        super.setUp()
        sut = CompanyTableViewDelegate()
        mock = NavigationDetailMock()
        sut.viewController = mock
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testDidSelection(){
        XCTAssertFalse(mock.success)
        sut.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mock.success)
    }
    
    
}
