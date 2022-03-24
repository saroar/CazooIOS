import SwiftUI
import ComposableArchitecture
import Models
import Combine
import SwiftUIHelper

struct VechileListView: View {
	public let store: Store<VechilesState, VechilesAction>

	init(store: Store<VechilesState, VechilesAction>) {
		self.store = store
	}

	public var body: some View {
		WithViewStore(self.store) { viewStore in
			ForEachStore(
				self.store.scope(
					state: \.vechiles,
					action: VechilesAction.vechile(id:action:)
				)
			) { vechileStore in

				WithViewStore(vechileStore) { vechileViewStore in
					Button {
						viewStore.send(.vechileDetailsTapped(vechileViewStore.state))
					} label: {
						VechileRowView(store: vechileStore)
					}
				}
			}
		}
	}
}

struct VechilesView_Previews: PreviewProvider {
	static var previews: some View {
		VechilesView(
			store: Store(
				initialState: VechilesState.mockData,
				reducer: vechilesReducer,
				environment: VechilesEnvironment.jsonToDataMock
			)
		)
	}
}

public struct VechileRowState: Equatable {
	public var vechile: Result
}

public enum VechileRowAction {
	case onAppear
}

public let vechileRowReducer: Reducer = Reducer<VechileRowState, VechileRowAction, Void> { state, action, _ in
	switch action {
	case .onAppear:
		return .none
	}
}


struct VechileRowView: View {
	let store: Store<Result, VechileRowAction>

	init(store: Store<Result, VechileRowAction>) {
		self.store = store
	}

	var body: some View {
		WithViewStore(self.store) { viewStore in
			VStack {
				VechileAsyncImageView(url: URL(string: viewStore.images.main.url))
					.padding()

				VStack {
					Text("\(viewStore.model)")
						.frame(maxWidth: .infinity, alignment: .leading)

					Text("\(viewStore.modelYear) - \(viewStore.registrationYear)")
						.foregroundColor(.gray)
						.frame(maxWidth: .infinity, alignment: .leading)

					Text("\(viewStore.mileage) miles per month")
						.foregroundColor(.gray)
						.frame(maxWidth: .infinity, alignment: .leading)
				}
				.padding(.horizontal)
			}
		}
	}
}
