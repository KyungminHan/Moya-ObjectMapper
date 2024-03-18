// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Moya-ObjectMapper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "Moya-ObjectMapper", targets: ["Moya-ObjectMapper"]),
        .library(name: "Moya-RxSwift-ObjectMapper", targets: ["Moya-RxSwift-ObjectMapper"]),
        .library(name: "Moya-ReactiveSwift-ObjectMapper", targets: ["Moya-ReactiveSwift-ObjectMapper"])
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", from: .init(14, 0, 0)),
        .package(url: "https://github.com/elmetal/ObjectMapper.git", .branch("feature/fix-swift-tools-version")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", from: .init(5, 1, 1)),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", from: .init(6, 1, 0))
    ],
    targets: [
        .target(
            name: "Moya-ObjectMapper",
            dependencies: [
                "Moya",
                "ObjectMapper"],
            path: "Source/Core",
            exclude: [
                "Sample"]),
        .target(
            name: "Moya-RxSwift-ObjectMapper",
            dependencies: [
                "Moya",
                "Moya-ObjectMapper",
                "ObjectMapper",
                "RxSwift",
                .product(name: "RxMoya", package: "Moya")
            ],
            path: "Source/RxSwift",
            exclude: [
                "Sample"]),
        .target(
            name: "Moya-ReactiveSwift-ObjectMapper",
            dependencies: [
                "Moya",
                "ObjectMapper",
                "Moya-ObjectMapper",
                "ReactiveSwift",
                .product(name: "ReactiveMoya", package: "Moya")
            ],
            path: "Source/ReactiveSwift",
            exclude: [
                "Sample"])
    ]
)
