import SwiftUI
import ComposableArchitecture
import Models
import Combine
import VechilesClient

extension VechileDetailsEnvironment {
	static public var live: VechileDetailsEnvironment = .init(
		mainQueue: .main,
		vechilesClient: .live
	)

	static public var mock: VechileDetailsEnvironment = .init(
		mainQueue: .immediate,
		vechilesClient: .mockData
	)
}
