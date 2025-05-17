// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScreenUI",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "ScreenUI",
            targets: [
                "WeatherUI"
            ])
    ],
    dependencies: [
        .package(url: "https://github.com/CarlFunk/AmpleDependency", from: Version(0, 2, 1)),
        .package(url: "https://github.com/CarlFunk/AmpleMock", from: Version(0, 1, 1)),
        .package(url: "https://github.com/CarlFunk/AmpleNavigation", from: Version(0, 3, 1)),
        .package(path: "./Domain"),
        .package(url: "https://github.com/kean/Nuke", from: Version(12, 8, 0)),
        .package(path: "./SharedUI")
    ],
    targets: [
        .target(
            name: "WeatherUI",
            dependencies: [
                .product(name: "AmpleDependency", package: "AmpleDependency"),
                .product(name: "AmpleMock", package: "AmpleMock"),
                .product(name: "AmpleNavigation", package: "AmpleNavigation"),
                .product(name: "Domain", package: "Domain"),
                .product(name: "NukeUI", package: "Nuke"),
                .product(name: "SharedUI", package: "SharedUI")
            ]),
        .testTarget(
            name: "WeatherUITests",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
                .product(name: "SharedUI", package: "SharedUI"),
                .target(name: "WeatherUI")
            ]
        ),
    ]
)
