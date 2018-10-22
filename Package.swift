// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Magellan",
    products: [
        .library(
            name: "Magellan",
            targets: ["Magellan"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/quick", from: "1.3.2")
    ],
    targets: [
        .target(
            name: "Magellan",
            dependencies: []),
        .testTarget(
            name: "MagellanTests",
            dependencies: ["Magellan", "Quick"],
            path: "Tests"),
    ]
)
