// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NvimApi",
    products: [
        .library(
            name: "NvimApi",
            targets: ["NvimApi"]),
    ],
    dependencies: [
        .package(url: "https://github.com/smolck/SwiftMsgPack.git", .branch("ext-type-or-types")),
        .package(url: "https://github.com/mxcl/PromiseKit", .branch("master")),
    ],
    targets: [
        .target(
            name: "NvimApi",
            dependencies: ["PromiseKit", "SwiftMsgPack"]),
        .testTarget(
            name: "NvimApiTests",
            dependencies: ["NvimApi"]),
    ]
)
