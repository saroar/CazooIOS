import SwiftUI
import ComposableArchitecture
import Models
import Combine
import VechilesClient

public enum VechileDetailsAction: Equatable, Hashable {
	case onAppear
	case vechileDetailsResponse(Swift.Result<VechileDeatails, CazooError>)
}

public struct VechileDetailsEnvironment {
	public var mainQueue: AnySchedulerOf<DispatchQueue>
	public var vechilesClient: VechilesClient
}
