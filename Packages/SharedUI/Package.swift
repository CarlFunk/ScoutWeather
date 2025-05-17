// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedUI",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "SharedUI",
            targets: [
                "SharedUI"
            ])
    ],
    dependencies: [
        .package(url: "https://github.com/CarlFunk/AmpleNavigation", from: Version(0, 3, 1)),
        .package(path: "./Domain")
    ],
    targets: [
        .target(
            name: "SharedUI",
            dependencies: [
                .product(name: "AmpleNavigation", package: "AmpleNavigation"),
                .product(name: "Domain", package: "Domain")
            ])
    ]
)
