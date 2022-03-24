// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "CazooSDK",
	platforms: [.iOS(.v15)],
	products: [
		.library(name: "AppFeature", targets: ["AppFeature"]),
		.library(name: "VechilesFeature", targets: ["VechilesFeature"]),
		.library(name: "VechileDetailsFeature", targets: ["VechileDetailsFeature"]),
		.library(name: "VechilesClient", targets: ["VechilesClient"]),
		.library(name: "Models", targets: ["Models"]),
		.library(name: "NetworkClient", targets: ["NetworkClient"]),
		.library(name: "SwiftUIHelper", targets: ["SwiftUIHelper"])
	],
	dependencies: [
		.package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.34.0")
	],
	targets: [
		.target(
			name: "AppFeature",
			dependencies: [
				.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
				"VechilesFeature"
			]
		),
		.target(
			name: "VechilesFeature",
			dependencies: [
				.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
				"Models", "VechilesClient", "VechileDetailsFeature", "SwiftUIHelper"
			]
		),
		.testTarget(name: "VechilesFeatureTests", dependencies: ["VechilesFeature"]),
		.target(
			name: "VechileDetailsFeature",
			dependencies: [
				.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
				"Models", "VechilesClient", "SwiftUIHelper"
			]
		),
		.target(
			name: "VechilesClient",
			dependencies: [
				.product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
				"Models", "NetworkClient", "SwiftUIHelper"
			]
		),

		.target(name: "Models", resources: [.process("Resources/")]),
		.target(name: "NetworkClient", dependencies: ["Models"]),
		.target(name: "SwiftUIHelper", dependencies: ["Models"])
	]
)
