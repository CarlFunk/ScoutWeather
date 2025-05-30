// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "Network",
            targets: [
                "NetworkCore",
                "NetworkService"
            ]),
        .library(
            name: "NetworkCore",
            targets: [
                "NetworkCore"
            ]),
        .library(
            name: "NetworkService",
            targets: [
                "NetworkService"
            ])
    ],
    targets: [
        .target(
            name: "NetworkCore"),
        .target(
            name: "NetworkService",
            dependencies: [
                .target(name: "NetworkCore")
            ])
    ]
)
