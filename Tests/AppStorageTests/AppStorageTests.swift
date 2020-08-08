import XCTest
@testable import AppStorage

final class AppStorageTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AppStorage().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
