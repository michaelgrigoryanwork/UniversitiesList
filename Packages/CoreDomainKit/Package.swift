// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreDomainKit",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "CoreDomainKit", targets: ["CoreDomainKit"]),
    ],
    dependencies: [
        .package(path: "../CoreDataKit"),
        .package(path: "../NetworkKit"),
        .package(path: "../PersistenceKit"),
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.0.0"))
    ],
    targets: [
        .target(
            name: "CoreDomainKit",
            dependencies: [
                .product(name: "CoreDataKit", package: "CoreDataKit"),
                .product(name: "NetworkKit", package: "NetworkKit"),
                .product(name: "PersistenceKit", package: "PersistenceKit"),
                .product(name: "RealmSwift", package: "realm-swift")
            ]
        ),
        .testTarget(
            name: "CoreDomainKitTests",
            dependencies: ["CoreDomainKit"]
        ),
    ]
)
