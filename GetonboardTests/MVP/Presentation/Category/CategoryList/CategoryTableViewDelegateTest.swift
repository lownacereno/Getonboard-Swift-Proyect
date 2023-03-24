import XCTest
@testable import Getonboard

class CategoryTableViewDelegateTest: XCTestCase{
    
    var sut : CategoryTableViewDelegate!
    var mock : NavigationToCategoriesMock!
    
    override func setUp() {
        super.setUp()
        sut = CategoryTableViewDelegate()
        mock = NavigationToCategoriesMock()
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
