# SideMenu
> A SwiftUI Side Menu Control (inspired by Instagram Stories Camera)

[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]

See below for examples and customization.

## Installation

### Requirements
* iOS 14.0+
* Xcode 13+
* Swift 5+

# Swift Package Manager

In Xcode, select: `File > Swift Packages > Add Package Dependency`.

Paste the package github url in the search bar `https://github.com/GlennBrann/SideMenu` and press next and follow instructions given via Xcode to complete installation.

You can then add SideMenu to your file by adding `import SideMenu`.

**Or**

Add this project on your `Package.swift`

```swift
import PackageDescription

let package = Package(
    dependencies: [
        .Package(url: "https://https://github.com/GlennBrann/SideMenu.git", branch: "main")
    ]
)
```

## Example

![Simulator Screen Recording - iPhone 12 mini - 2021-09-19 at 18 07 20](https://user-images.githubusercontent.com/5156285/133944541-ff4d1e45-f592-400e-b2e9-7a564f785626.gif)

## License

SideMenu is available under the BSD 3-Clause. See the LICENSE file for more info.

[swift-image]:https://img.shields.io/badge/swift-5.3-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
