// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "ReleaseTools",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "rt", targets: ["ReleaseTools"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.2"),
        .package(url: "https://github.com/elegantchaos/BuilderConfiguration.git", from: "1.1.4"),
        .package(url: "https://github.com/elegantchaos/Logger.git", from: "1.5.3"),
        .package(url: "https://github.com/elegantchaos/Runner.git", from: "1.2.0"),
        .package(url: "https://github.com/elegantchaos/Files.git", from: "1.0.5"),
        .package(url: "https://github.com/elegantchaos/XCTestExtensions.git", from: "1.0.9"),
    ],
    targets: [
        .target(
            name: "ReleaseTools",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Files",
                "Logger",
                "Runner",
            ]),
        .target(
            name: "Configure",
            dependencies: ["BuilderConfiguration"]),
        .testTarget(
            name: "ReleaseToolsTests",
            dependencies: ["ReleaseTools", "XCTestExtensions"]),
    ]
)
