import SwiftUI
import ComposableArchitecture
import Combine
import VechilesClient

public var vechileDetailsReducer = Reducer<VechileDetailsState, VechileDetailsAction, VechileDetailsEnvironment> { state, action, environment in
	switch action {

	case .onAppear:
		return environment.vechilesClient
			.vechileDetails(state.productId)
			.receive(on: environment.mainQueue)
			.catchToEffect()
			.map(VechileDetailsAction.vechileDetailsResponse)


	case let .vechileDetailsResponse(.success(response)):
		state.vechilesD = response
		state.imageGallery = response.imageGallery
		return .none

	case let .vechileDetailsResponse(.failure(error)):
		// handle error
		return .none
	}
}
