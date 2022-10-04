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

![SideMenu](https://user-images.githubusercontent.com/5156285/193725724-56ccfbc1-7cf4-406b-b604-667307234cea.gif)

![SideMenu2](https://user-images.githubusercontent.com/5156285/193726712-801773e6-5bb0-4aa5-85d2-344dca1770c9.gif)

```
let allMenuItems = [
    MenuItem(id: "create", title: "Create", image: "textformat", selected: false),
    MenuItem(id: "boomerang", title: "Boomerang", image: "infinity", selected: false),
    MenuItem(id: "layout", title: "Layout", image: "square.split.bottomrightquarter.fill", selected: false),
    MenuItem(id: "handsfree", title: "Hands-free", image: "stop.circle", selected: false),
    MenuItem(id: "dual", title: "Dual", image: "camera.shutter.button", selected: false)
]

struct ContentView: View {
    
    @State private var selectedItem: MenuItem?
    @State private var menuAlignment: HorizontalAlignment = .leading
    
    var body: some View {
        Color.gray.opacity(0.5).edgesIgnoringSafeArea(.all)
            .addInstaMenu(
                menuItems: allMenuItems,
                closedDisplayCount: 3,
                selectedItem: $selectedItem,
                menuAlignment: $menuAlignment
            )
    }
}
```

## License

SideMenu is available under the BSD 3-Clause. See the LICENSE file for more info.

[swift-image]:https://img.shields.io/badge/swift-5.3-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
