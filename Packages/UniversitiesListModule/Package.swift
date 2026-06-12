// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UniversitiesListModule",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "UniversitiesListModule", targets: ["UniversitiesListModule"]),
    ],
    dependencies: [
        .package(path: "../CoreDomainKit"),
        .package(path: "../CoreDataKit"),
        .package(path: "../UISharedKit")
    ],
    targets: [
        .target(
            name: "UniversitiesListModule",
            dependencies: [
                .product(name: "CoreDomainKit", package: "CoreDomainKit"),
                .product(name: "CoreDataKit", package: "CoreDataKit"),
                .product(name: "UISharedKit", package: "UISharedKit")
            ]
        ),
        .testTarget(
            name: "UniversitiesListModuleTests",
            dependencies: ["UniversitiesListModule"]
        ),
    ]
)
