import XCTest
@testable import Getonboard

class CategoryDetailTableViewDelegateTest: XCTestCase{
    
    var sut : CategoryDetailTableViewDelegate!
    var mock : NavigationToJobsMock!
    
    override func setUp() {
        super.setUp()
        sut = CategoryDetailTableViewDelegate()
        mock = NavigationToJobsMock()
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
