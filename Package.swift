// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOS-SSP-Teads-SPM",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "AdMixerMediationTeads",
            targets: ["iOS_SSP_Teads_SPM"]
        ),
    ],
    dependencies: [
        // Teads SDK
        .package(
            url: "https://github.com/teads/TeadsSDK-iOS.git",
            .upToNextMajor(from: "6.0.0")
        ),
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.3.2"
        )
    ],
    targets: [
        .binaryTarget(
            name: "AdMixerMediationTeadsBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-AdMixerDownload/raw/main/AdMixerMediationTeads0.1.0.xcframework.zip",
            checksum: "a34dcd244c16d9abc5f00c52fadfa5a8b2a21dddbcf54fc2118d6009a209c204"
        ),
        .target(
            name: "iOS_SSP_Teads_SPM",
            dependencies: [
                "AdMixerMediationTeadsBinary",
                .product(name: "TeadsSDK",
                         package: "TeadsSDK-iOS"),
                .product(name: "AdMixerMediation",
                         package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-Teads-SPM"
        )
    ]
)
