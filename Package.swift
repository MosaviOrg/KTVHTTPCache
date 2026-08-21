// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "KTVHTTPCache",
            targets: ["KTVHTTPCache"]
        ),
    ],
    targets: [
        .target(
            name: "CocoaAsyncSocket",
            path: "Vendors/CocoaAsyncSocket",
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("CFNetwork"),
                .linkedFramework("Security"),
            ]
        ),
        .target(
            name: "KTVHTTPCache",
            dependencies: ["CocoaAsyncSocket"],
            path: "KTVHTTPCache",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("Classes/KTVHCCommon"),
                .headerSearchPath("Classes/KTVHCDataStorage"),
                .headerSearchPath("Classes/KTVHCDownload"),
                .headerSearchPath("Classes/KTVHCHTTPServer"),
                .headerSearchPath("Classes/KTVHCTools"),
                .headerSearchPath("CocoaHTTPServer"),
                .headerSearchPath("CocoaHTTPServer/Categories"),
                .headerSearchPath("CocoaHTTPServer/Mime"),
                .headerSearchPath("CocoaHTTPServer/Responses"),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
            ]
        ),
        .testTarget(
            name: "KTVHTTPCacheTests",
            dependencies: ["KTVHTTPCache"],
            path: "Tests/KTVHTTPCacheTests"
        ),
    ]
)
