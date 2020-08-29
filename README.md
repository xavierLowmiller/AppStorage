# AppStorage

A drop-in replacement for the iOS 14 `@AppStorage` property wrapper.

## Features

- [x] 100% identical API as SwiftUI's `@AppStorage` property wrapper
- [x] Fully compatible with iOS 13, macOS Catalina, watchOS 6, tvOS 13
- [x] Automatically updates when the underlying `UserDefaults` changes
- [x] Well tested

## Usage

```swift
// iOS 14
@AppStorage("text") var text = "Default Text"
@AppStorage("magic_number", store: .customUserDefaults) var magicNumber = 42

// iOS 13
@Persistence("text") var text = "Default Text"
@Persistence("magic_number", store: .customUserDefaults) var magicNumber = 42
```

<details><summary>More complete example</summary>
<p>

```swift
import SwiftUI
import AppStorage

enum StringEnum: String, Identifiable {
    case a, b, c
    var id: String { rawValue }
}

enum IntEnum: Int, Identifiable {
    case this, that, theOther
    var id: Int { rawValue }
}

struct ContentView: View {
    @Persistence("text", store: .standard) var text = "Default Text"
    @Persistence("string_enum") var selectionString: StringEnum = .a
    @Persistence("int_enum") var selectionInt: IntEnum = .this

    var body: some View {
        List {
            Section(header: Text("Acts like a persistent @State")) {
                TextField("Change me", text: $text)
                TextField("Change me, too!", text: $text)
            }

            Section(header: Text("Change UserDefaults without property wrapper")) {
                Button("Sneakily change a UserDefault") {
                    UserDefaults.standard.setValue("One more thing...", forKey: "text")
                }
                Button("Remove a UserDefault") {
                    UserDefaults.standard.setValue(nil, forKey: "text")
                }
            }

            Section(header: Text("Enums with raw values")) {
                Picker("Pick Me", selection: $selectionString) {
                    Text("a").tag(StringEnum.a)
                    Text("b").tag(StringEnum.b)
                    Text("c").tag(StringEnum.c)
                }.pickerStyle(SegmentedPickerStyle())

                Picker("Pick Me", selection: $selectionInt) {
                    Text("this").tag(IntEnum.this)
                    Text("that").tag(IntEnum.that)
                    Text("the other").tag(IntEnum.theOther)
                }.pickerStyle(SegmentedPickerStyle())
            }

        }.listStyle(GroupedListStyle())
    }
}
```

<img src="https://github.com/xavierLowmiller/AppStorage/raw/main/Images/Example.gif" width="375">

</p>
</details>

## Installation

### Swift Package Manager

Add the package to your Package.swift file:

```swift
dependencies: [
    .package(url: "https://github.com/xavierLowmiller/AppStorage.git", .upToNextMajor(from: "1.0.2"))
]
```

### CocoaPods

Add the pod to your Podfile:

```ruby
platform :ios, '13.0'
use_frameworks!

target 'MyApp' do
  pod 'AppStorage', '~> 1.0.2'
end
```

### Carthage

Add this line to your Cartfile:

```ruby
github "xavierLowmiller/AppStorage" ~> 1.0.2
```

### Manual

Since it's just a single file, you can just download and drag it to your project.
