import SwiftUI
import ComposableArchitecture
import Models
import Combine
import VechilesClient
import VechileDetailsFeature

public struct VechilesState: Equatable, Hashable {
	public init(vechiles: IdentifiedArrayOf<Result> = [], isLoading: Bool = false) {
		self.vechiles = vechiles
		self.isLoading = isLoading
	}

	public var vechiles: IdentifiedArrayOf<Result> = []
	public var isLoading = false
	public var vechileDetailsState: VechileDetailsState?
	public var isVechileDetailsNavigate: Bool {
		vechileDetailsState != nil
	}
	public var alert: AlertState<VechilesAction>?

}

extension VechilesState {
	static let mockData: VechilesState = .init(
		vechiles:  .init(uniqueElements: Vechiles.mockData.results),
		isLoading: false
	)
}
