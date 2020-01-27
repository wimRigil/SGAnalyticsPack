import XCTest
@testable import SGAnalytics

final class SGAnalyticsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SGAnalytics().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
