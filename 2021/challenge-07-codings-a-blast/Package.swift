// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "challenge-07-codings-a-blast",
    platforms: [.macOS(.v11)],
    products: [
        .executable(name: "challenge-07-codings-a-blast", targets: ["challenge-07-codings-a-blast"])
    ],
    dependencies: [
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", from: "0.7.0")
    ],
    targets: [
        .target(
            name: "challenge-07-codings-a-blast",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]),
        .testTarget(
            name: "challenge-07-codings-a-blastTests",
            dependencies: ["challenge-07-codings-a-blast"]),
    ]
)