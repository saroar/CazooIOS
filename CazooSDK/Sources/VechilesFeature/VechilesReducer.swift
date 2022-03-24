import SwiftUI
import ComposableArchitecture
import Models
import Combine
import VechilesClient
import VechileDetailsFeature

public let vechilesReducer = Reducer<VechilesState, VechilesAction, VechilesEnvironment>.combine(
	vechileDetailsReducer
		.optional()
		.pullback(
			state: \VechilesState.vechileDetailsState,
			action: /VechilesAction.vechileDetails,
			environment: { _ in VechileDetailsEnvironment.live }
		),
	.init { state, action, environment in

	switch action {
	case .onAppear:
		state.isLoading = state.vechiles.count <= 0

		return environment.vechilesClient
			.vechiles()
			.receive(on: environment.mainQueue)
			.catchToEffect()
			.map(VechilesAction.vechilesResponse)

	case let .vechilesResponse(.success(response)):
		state.isLoading = false
		state.vechiles = .init(uniqueElements: response.results)
		return .none

	case let .vechilesResponse(.failure(error)):
		// handle error
		state.isLoading = false
		print(#line, error.localizedDescription)
		return .none
	case .vechile(id: let id, action: let action):
		return .none
	case let .vechileDetailsTapped(result):
		if result.id.hasSuffix("-de") || result.id.hasSuffix("-fr") {
			return Effect(value: .isCar(isAvilable: true))
				.eraseToEffect()
		}

		state.vechileDetailsState = .init(productId: result.id, vechilesD: VechileDeatails.emptyData, isLoading: true, imageGallery: [])
		return .none

	case let .vechileDetails(acion):
		return .none
	case .vechileDetailsView(isNavigate: let isNavigate):
		if isNavigate == false { state.vechileDetailsState = nil }
		return .none
	case .isCar(isAvilable: let isAvilable):
		state.alert = .init(
			title: TextState("We are sorry!"),
			message: TextState("This Car is not avilable right now!"),
			dismissButton: .cancel(.init("Cancel"), action: .send(.alertDismissed))
		)
		return .none
	case .alertDismissed:
		state.alert = nil
		return .none
	}
})
	.debug()
