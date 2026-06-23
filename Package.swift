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
            from: "2.3.6"
        )
    ],
    targets: [
        .target(
            name: "iOS_SSP_Teads_SPM",
            dependencies: [
                "AdMixerMediationTeadsBinary",
                "TeadsSDK",
                "OMSDK_Teadstv",
                .product(name: "AdMixerMediation",
                         package: "ios-ssp-mediation-spm")
            ],
            path: "Sources/iOS-SSP-Teads-SPM"
        ),
        .binaryTarget(
            name: "AdMixerMediationTeadsBinary",
            url: "https://github.com/Nasmedia-Tech/iOS-SSP-Teads-SPM/releases/download/1.0.0/AdMixerMediationTeads1.0.0.xcframework.zip",
            checksum: "26937ca06b393c5d4d04a2dc4372baf6f7c5544d2e99f1990142ed0ea27ba83b"
        ),
        .binaryTarget(
            name: "TeadsSDK", //Teads v6.1.0
            path: "Frameworks/TeadsSDK.xcframework"
        ),
        .binaryTarget(
            name: "OMSDK_Teadstv",
            path: "Frameworks/OMSDK_Teadstv.xcframework"
        )
    ]
)
