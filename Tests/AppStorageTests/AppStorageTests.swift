import XCTest
@testable import AppStorage

final class AppStorageTests: XCTestCase {

    func testStoringBooleansShouldBeEquivalentToAppStorage() {
        let store = UserDefaults(suiteName: #function)!

        let persistence = Persistence(wrappedValue: true, "boolean", store: store)
        persistence.wrappedValue = false

        XCTAssertEqual(store.bool(forKey: "boolean"), false)
    }

    func testStoringIntegersShouldBeEquivalentToAppStorage() {
        let store = UserDefaults(suiteName: #function)!

        let persistence = Persistence(wrappedValue: 42, "magic number", store: store)
        persistence.wrappedValue = 43

        XCTAssertEqual(store.integer(forKey: "magic number"), 43)
    }

    func testStoringDoublesShouldBeEquivalentToAppStorage() {
        let store = UserDefaults(suiteName: #function)!

        let persistence = Persistence(wrappedValue: 42.0, "magic number", store: store)
        persistence.wrappedValue = 42.1

        XCTAssertEqual(store.double(forKey: "magic number"), 42.1)
    }

    func testStoringStringsShouldBeEquivalentToAppStorage() {
        let store = UserDefaults(suiteName: #function)!

        let persistence = Persistence(wrappedValue: "surfin' bird", "the word", store: store)
        persistence.wrappedValue = "bird"

        XCTAssertEqual(store.string(forKey: "the word"), "bird")
    }

    func testStoringURLsShouldBeEquivalentToAppStorage() {
        let store = UserDefaults(suiteName: #function)!

        let url1 = URL(string: "https://example.com")!
        let url2 = URL(string: "https://example.org")!

        let persistence = Persistence(wrappedValue: url1, "url", store: store)
        persistence.wrappedValue = url2

        XCTAssertEqual(store.url(forKey: "url"), url2)
    }

    func testStoringDataShouldBeEquivalentToAppStorage() {
        let store = UserDefaults(suiteName: #function)!

        let data1 = "0101".data(using: .utf8)!
        let data2 = "1010".data(using: .utf8)!

        let persistence = Persistence(wrappedValue: data1, "raw data", store: store)
        persistence.wrappedValue = data2

        XCTAssertEqual(store.data(forKey: "raw data"), data2)
    }

    func testStoringStringEnumsShouldBeEquivalentToAppStorage() {
        let store = UserDefaults(suiteName: #function)!

        enum StringEnum: String { case a, b }

        let persistence = Persistence(wrappedValue: StringEnum.a, "string enum", store: store)
        persistence.wrappedValue = .b

        XCTAssertEqual(store.string(forKey: "string enum"), "b")
    }

    func testStoringIntegerEnumsShouldBeEquivalentToAppStorage() {
        let store = UserDefaults(suiteName: #function)!

        enum IntEnum: Int { case a, b }

        let persistence = Persistence(wrappedValue: IntEnum.a, "int enum", store: store)
        persistence.wrappedValue = .b

        XCTAssertEqual(store.integer(forKey: "int enum"), 1)
    }
}
