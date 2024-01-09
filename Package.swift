// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "octokit-cli",
    dependencies: [
        .package(url: "https://github.com/nerdishbynature/octokit.swift", from: "0.11.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "octokit-cli",
            dependencies: [
                .product(name: "OctoKit", package: "octokit.swift"),
            ]
        ),
    ]
)
