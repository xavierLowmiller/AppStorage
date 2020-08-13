import XCTest
import SwiftUI
@testable import AppStorage

#if swift(>=5.3)
@available(macOS 11, iOS 14, tvOS 14, watchOS 7, *)
final class AppStorageTests: XCTestCase {

    func testStoringBooleansShouldBeEquivalentToAppStorage() {
        let storeSwiftUI = UserDefaults(suiteName: #function + "SwiftUI")!
        let storePackage = UserDefaults(suiteName: #function + "Package")!

        // SwiftUI
        let swiftUI = AppStorage(wrappedValue: true, "boolean", store: storeSwiftUI)
        swiftUI.wrappedValue = false

        // AppStorage Package
        let package = Persistence(wrappedValue: true, "boolean", store: storePackage)
        package.wrappedValue = false

        XCTAssertEqual(storePackage.bool(forKey: "boolean"), false)
        XCTAssertEqual(storeSwiftUI.dictionaryRepresentation() as NSDictionary,
                       storePackage.dictionaryRepresentation() as NSDictionary)
    }

    func testStoringIntegersShouldBeEquivalentToAppStorage() {
        let storeSwiftUI = UserDefaults(suiteName: #function + "SwiftUI")!
        let storePackage = UserDefaults(suiteName: #function + "Package")!

        // SwiftUI
        let swiftUI = AppStorage(wrappedValue: 42, "magic number", store: storeSwiftUI)
        swiftUI.wrappedValue = 43

        // AppStorage Package
        let package = Persistence(wrappedValue: 42, "magic number", store: storePackage)
        package.wrappedValue = 43

        XCTAssertEqual(storePackage.integer(forKey: "magic number"), 43)
        XCTAssertEqual(storeSwiftUI.dictionaryRepresentation() as NSDictionary,
                       storePackage.dictionaryRepresentation() as NSDictionary)
    }

    func testStoringDoublesShouldBeEquivalentToAppStorage() {
        let storeSwiftUI = UserDefaults(suiteName: #function + "SwiftUI")!
        let storePackage = UserDefaults(suiteName: #function + "Package")!

        // SwiftUI
        let swiftUI = AppStorage(wrappedValue: 42.0, "magic number", store: storeSwiftUI)
        swiftUI.wrappedValue = 42.1

        // AppStorage Package
        let package = Persistence(wrappedValue: 42.0, "magic number", store: storePackage)
        package.wrappedValue = 42.1

        XCTAssertEqual(storePackage.double(forKey: "magic number"), 42.1)
        XCTAssertEqual(storeSwiftUI.dictionaryRepresentation() as NSDictionary,
                       storePackage.dictionaryRepresentation() as NSDictionary)
    }

    func testStoringStringsShouldBeEquivalentToAppStorage() {
        let storeSwiftUI = UserDefaults(suiteName: #function + "SwiftUI")!
        let storePackage = UserDefaults(suiteName: #function + "Package")!

        // SwiftUI
        let swiftUI = AppStorage(wrappedValue: "surfin' bird", "the word", store: storeSwiftUI)
        swiftUI.wrappedValue = "bird"

        // AppStorage Package
        let package = Persistence(wrappedValue: "surfin' bird", "the word", store: storePackage)
        package.wrappedValue = "bird"

        XCTAssertEqual(storePackage.string(forKey: "the word"), "bird")
        XCTAssertEqual(storeSwiftUI.dictionaryRepresentation() as NSDictionary,
                       storePackage.dictionaryRepresentation() as NSDictionary)
    }

    func testStoringURLsShouldBeEquivalentToAppStorage() {
//        let storeSwiftUI = UserDefaults(suiteName: #function + "SwiftUI")!
        let storePackage = UserDefaults(suiteName: #function + "Package")!

        let url1 = URL(string: "https://example.com")!
        let url2 = URL(string: "https://example.org")!

        // SwiftUI
        // SwiftUI Crashes here (at least in iOS 14 beta 4)
//        let swiftUI = AppStorage(wrappedValue: url1, "url", store: storeSwiftUI)
//        swiftUI.wrappedValue = url2

        // AppStorage Package
        let package = Persistence(wrappedValue: url1, "url", store: storePackage)
        package.wrappedValue = url2

        XCTAssertEqual(storePackage.string(forKey: "url"), url2.absoluteString)
//        XCTAssertEqual(storeSwiftUI.dictionaryRepresentation() as NSDictionary,
//                       storePackage.dictionaryRepresentation() as NSDictionary)
    }

    func testStoringStringEnumsShouldBeEquivalentToAppStorage() {
        let storeSwiftUI = UserDefaults(suiteName: #function + "SwiftUI")!
        let storePackage = UserDefaults(suiteName: #function + "Package")!

        enum StringEnum: String { case a, b }

        // SwiftUI
        let swiftUI = AppStorage(wrappedValue: StringEnum.a, "string enum", store: storeSwiftUI)
        swiftUI.wrappedValue = .b

        // AppStorage Package
        let package = Persistence(wrappedValue: StringEnum.a, "string enum", store: storePackage)
        package.wrappedValue = .b

        XCTAssertEqual(storePackage.string(forKey: "string enum"), "b")
        XCTAssertEqual(storeSwiftUI.dictionaryRepresentation() as NSDictionary,
                       storePackage.dictionaryRepresentation() as NSDictionary)
    }

    func testStoringIntegerEnumsShouldBeEquivalentToAppStorage() {
        let storeSwiftUI = UserDefaults(suiteName: #function + "SwiftUI")!
        let storePackage = UserDefaults(suiteName: #function + "Package")!

        enum IntEnum: Int { case a, b }

        // SwiftUI
        let swiftUI = AppStorage(wrappedValue: IntEnum.a, "int enum", store: storeSwiftUI)
        swiftUI.wrappedValue = .b

        // AppStorage Package
        let package = Persistence(wrappedValue: IntEnum.a, "int enum", store: storePackage)
        package.wrappedValue = .b

        XCTAssertEqual(storePackage.integer(forKey: "int enum"), 1)
        XCTAssertEqual(storeSwiftUI.dictionaryRepresentation() as NSDictionary,
                       storePackage.dictionaryRepresentation() as NSDictionary)
    }
}
#endif
