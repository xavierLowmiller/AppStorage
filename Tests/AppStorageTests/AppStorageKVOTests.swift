import XCTest
@testable import AppStorage

final class AppStorageKVOTests: XCTestCase {

    func testUpdatingTheValueInUserDefaultsShouldReflectInPropertyWrapper() {
        let store = UserDefaults(suiteName: #function)!
        let persistence = Persistence(wrappedValue: true, "boolean", store: store)

        store.set(false, forKey: "boolean")

        XCTAssertEqual(persistence.wrappedValue, false)
    }

    func testSettingTheValueToNilShouldRestoreDefaultValue() {
        let store = UserDefaults(suiteName: #function)!
        let persistence = Persistence(wrappedValue: true, "boolean", store: store)
        persistence.wrappedValue = false

        store.set(nil, forKey: "boolean")

        XCTAssertEqual(persistence.wrappedValue, true)
    }

    func testKVODeinit() {
        let store = UserDefaults(suiteName: #function)!

        do {
            let persistence = Persistence(wrappedValue: true, "boolean", store: store)
            persistence.wrappedValue = false
        }

        // No crash - pass!
    }
}
