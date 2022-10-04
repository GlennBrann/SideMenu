# SideMenu
> A SwiftUI Side Menu Control (inspired by Instagram Stories Camera)

[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]

ManySheets has a list of custom SwiftUI Bottom Sheet components.

1. **DefaultBottomSheet:** A dynamic bottom sheet that scales based on content height inside.
2. **ScaffoldBottomSheet:** A scaffolding bottom sheet with three positions (top, middle, bottom).

See below for examples and customization.

## Installation

### Requirements
* iOS 14.0+
* Xcode 13+
* Swift 5+

# Swift Package Manager

In Xcode, select: `File > Swift Packages > Add Package Dependency`.

Paste the package github url in the search bar `https://github.com/GlennBrann/ManySheets` and press next and follow instructions given via Xcode to complete installation.

You can then add ManySheets to your file by adding `import ManySheets`.

**Or**

Add this project on your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://https://github.com/GlennBrann/ManySheets.git", from: "1.2.0")
    ]
)
```

## DefaultBottomSheet

![Simulator Screen Recording - iPhone 12 mini - 2021-09-19 at 18 07 20](https://user-images.githubusercontent.com/5156285/133944541-ff4d1e45-f592-400e-b2e9-7a564f785626.gif)

## License

ManySheets is available under the MIT license. See the LICENSE file for more info.

[swift-image]:https://img.shields.io/badge/swift-5.3-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
