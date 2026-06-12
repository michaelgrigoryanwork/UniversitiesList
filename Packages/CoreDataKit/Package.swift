// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDataKit",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "CoreDataKit", targets: ["CoreDataKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.0.0"))
    ],
    targets: [
        .target(
            name: "CoreDataKit",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift")
            ]
        ),
        .testTarget(
            name: "CoreDataKitTests",
            dependencies: ["CoreDataKit"]
        ),
    ]
)
