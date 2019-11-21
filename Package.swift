// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ESTabBarController",
    products: [
        .library(name: "ESTabBarController",  targets: ["ESTabBarController"])
    ],
    dependencies: [],
    targets: [
        .target(name: "ESTabBarController", path: "Sources")
    ]
)
