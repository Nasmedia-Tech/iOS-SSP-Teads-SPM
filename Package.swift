// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iOS-SSP-Teads-SPM",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AdMixerMediationTeads",
            targets: ["iOS_SSP_Teads_SPM"]
        ),
    ],
    dependencies: [
        // SSP AdMixerMediation SDK
        .package(
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Mediation-SPM.git",
            from: "2.4.2"
        )
    ],
    targets: [
        .target(
            name: "iOS_SSP_Teads_SPM",
            dependencies: [
                "AdMixerMediationTeadsBinary",
                "TeadsSDK",
                "OMSDK_Teads",
                .product(name: "AdMixerMediation",
                         package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-Teads-SPM"
        ),
        .binaryTarget(
            name: "AdMixerMediationTeadsBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Teads-SPM/releases/download/1.1.0/AdMixerMediationTeads1.1.0.xcframework.zip",
            checksum: "8420d82ee8469d909e9da7f5aa2d84b84306c2473836b2adabb148eaea7c3a2d"
        ),
        .binaryTarget(
            name: "TeadsSDK", //Teads v6.2.0
            path: "Frameworks/TeadsSDK.xcframework"
        ),
        .binaryTarget(
            name: "OMSDK_Teads",
            path: "Frameworks/OMSDK_Teads.xcframework"
        )
    ]
)
