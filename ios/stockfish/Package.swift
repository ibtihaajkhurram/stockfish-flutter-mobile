// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "stockfish",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "stockfish", targets: ["stockfish"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "stockfish",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            exclude: [
                "Stockfish/src/nn-82215d0fd0df.nnue",
                "Stockfish/src/incbin/UNLICENCE"
            ],
            cSettings: [
                .headerSearchPath("include/stockfish"),
                .headerSearchPath("Stockfish/src")
            ],
            cxxSettings: [
                .headerSearchPath("include/stockfish"),
                .headerSearchPath("Stockfish/src"),
                .unsafeFlags(["-std=c++17", "-w"])
            ],
            linkerSettings: [
                .linkedLibrary("c++")
            ]
        )
    ]
)
