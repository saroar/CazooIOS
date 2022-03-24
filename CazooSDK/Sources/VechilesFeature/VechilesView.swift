import SwiftUI
import ComposableArchitecture
import Models
import Combine
import VechilesClient
import VechileDetailsFeature

public struct VechilesView: View {

	let store: Store<VechilesState, VechilesAction>

	public init(store: Store<VechilesState, VechilesAction>) {
		self.store = store
	}

	public var body: some View {
		WithViewStore(self.store) { viewStore in
			VStack {
				ScrollView {
					LazyVStack {
						VechileListView(
							store: viewStore.isLoading
							? Store(
								initialState: VechilesState.mockData,
								reducer: .empty,
								environment: ()
							)
							: self.store
						)
						.redacted(reason: viewStore.isLoading ? .placeholder : [])
					}
				}
			}
			.navigationBarTitle("Vechiles")
			.onAppear { viewStore.send(.onAppear) }
			.alert(self.store.scope(state: \.alert), dismiss: .alertDismissed)
			.background(
				NavigationLink(
					destination: IfLetStore(
					  self.store.scope(
						state: \.vechileDetailsState,
						action: VechilesAction.vechileDetails
					  ),
					  then: VechileDetailsView.init(store:),
					  else: ProgressView.init
					),
					isActive: viewStore.binding(
					  get: \.isVechileDetailsNavigate,
					  send: VechilesAction.vechileDetailsView(isNavigate:)
					)
				) {}
			)
		}

	}
}

