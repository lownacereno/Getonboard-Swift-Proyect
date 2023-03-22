import XCTest
@testable import Getonboard

class JobRequirementsViewController: XCTestCase {

    var sut : JobRequirementsViewController!
    
    override func setUp() {
        super.setUp()
        sut = JobRequirementsViewController()
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    
        func testLabel() {
            // Create a label
            let label = sut.
            label.text = "Hello, world!"
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = UIColor.black

            // Assert that the label's properties are set correctly
            XCTAssertEqual(label.text, "Hello, world!")
            XCTAssertEqual(label.font, UIFont.systemFont(ofSize: 16))
            XCTAssertEqual(label.textColor, UIColor.black)
        }

    }
    
