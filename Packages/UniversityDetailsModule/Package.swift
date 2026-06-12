// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UniversityDetailsModule",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "UniversityDetailsModule", targets: ["UniversityDetailsModule"]),
    ],
    dependencies: [
        .package(path: "../UISharedKit"),
        .package(path: "../CoreDataKit")
    ],
    targets: [
        .target(
            name: "UniversityDetailsModule",
            dependencies: [
                .product(name: "UISharedKit", package: "UISharedKit"),
                .product(name: "CoreDataKit", package: "CoreDataKit")
            ]
        ),
        .testTarget(
            name: "UniversityDetailsModuleTests",
            dependencies: ["UniversityDetailsModule"]
        ),
    ]
)
