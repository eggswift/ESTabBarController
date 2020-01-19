// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ESTabBarController",
    platforms: [
        .iOS(.v8),
    ],
    products: [
        .library(name: "ESTabBarController",  targets: ["ESTabBarController"])
    ],
    dependencies: [],
    targets: [
        .target(name: "ESTabBarController", path: "Sources")
    ],
    swiftLanguageVersions: [.v5]
)
