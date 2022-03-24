import SwiftUI
import ComposableArchitecture
import Models
import Combine
import VechilesClient

public struct VechilesEnvironment {
	public var mainQueue: AnySchedulerOf<DispatchQueue>
	public var vechilesClient: VechilesClient
}

extension VechilesEnvironment {
	static public var live: VechilesEnvironment = .init(
		mainQueue: .main,
		vechilesClient: .live
	)

	static public var jsonToDataMock: VechilesEnvironment = .init(mainQueue: .immediate, vechilesClient: .mockData)
}
