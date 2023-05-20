// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "ComponentA",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "ComponentA", targets: ["ComponentA"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.76.0"),
    ],
    targets: [
        .executableTarget(
            name: "ComponentA",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ],
            resources: [
                .process("Resources")
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .testTarget(name: "ComponentATests", dependencies: ["ComponentA"])
    ]
)
