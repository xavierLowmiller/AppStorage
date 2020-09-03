Pod::Spec.new do |spec|

  spec.name         = "AppStorage"
  spec.version      = "1.0.2"
  spec.summary      = "A drop-in replacement for the iOS 14 `@AppStorage` property wrapper."

  spec.description  = <<-DESC
    - [x] 100% identical API as SwiftUI's `@AppStorage` property wrapper
    - [x] Fully compatible with iOS 13, macOS Catalina, watchOS 6, tvOS 13
    - [x] Automatically updates when the underlying `UserDefaults` changes
    - [x] Well tested
    DESC

  spec.homepage     = "https://github.com/xavierLowmiller/AppStorage"
  spec.screenshots  = "https://github.com/xavierLowmiller/AppStorage/raw/main/Images/Example.gif"

  spec.license      = {
    :type => "MIT",
    :file => "LICENSE"
  }

  spec.author             = { "Xavier Lowmiller" => "xaver.lohmueller@me.com" }
  spec.social_media_url   = "https://twitter.com/xavierLowmiller"

  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"
  spec.watchos.deployment_target = "6.0"
  spec.tvos.deployment_target = "13.0"
  spec.swift_version = "5.2"

  spec.source       = { :git => "https://github.com/xavierLowmiller/AppStorage.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/**/*.swift"

  spec.framework  = "SwiftUI", "Combine"
end
