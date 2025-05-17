// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "Domain",
            targets: [
                "CommonDomain",
                "LocationDomain",
                "SettingsDomain",
                "WeatherDomain"
            ])
    ],
    dependencies: [
        .package(url: "https://github.com/CarlFunk/AmpleMock", from: Version(0, 1, 1))
    ],
    targets: [
        .target(
            name: "CommonDomain",
            dependencies: [
                .product(name: "AmpleMock", package: "AmpleMock")
            ]),
        .target(
            name: "LocationDomain",
            dependencies: [
                .product(name: "AmpleMock", package: "AmpleMock"),
                .target(name: "CommonDomain")
            ]),
        .target(
            name: "SettingsDomain",
            dependencies: [
                .product(name: "AmpleMock", package: "AmpleMock")
            ]),
        .target(
            name: "WeatherDomain",
            dependencies: [
                .product(name: "AmpleMock", package: "AmpleMock"),
                .target(name: "CommonDomain")
            ])
    ]
)
