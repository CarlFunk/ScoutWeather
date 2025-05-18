// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "Data",
            targets: [
                "LocationData",
                "SettingsData",
                "WeatherData"
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/CarlFunk/AmpleDependency", from: Version(0, 2, 1)),
        .package(path: "./Domain"),
        .package(path: "./Network"),
    ],
    targets: [
        .target(
            name: "LocationData",
            dependencies: [
                .product(name: "Domain", package: "Domain")
            ]),
        .target(
            name: "SettingsData",
            dependencies: [
                .product(name: "Domain", package: "Domain")
            ]),
        .target(
            name: "WeatherData",
            dependencies: [
                .product(name: "AmpleDependency", package: "AmpleDependency"),
                .product(name: "Domain", package: "Domain"),
                .product(name: "NetworkCore", package: "Network")
            ]),
        .testTarget(
            name: "WeatherDataTests",
            dependencies: [
                .product(name: "Domain", package: "Domain"),
                .target(name: "WeatherData")
            ])
    ]
)
