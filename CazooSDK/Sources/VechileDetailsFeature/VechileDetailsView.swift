import SwiftUI
import ComposableArchitecture
import Models
import Combine
import VechilesClient
import SwiftUIHelper

public struct VechileDetailsView: View {

	private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
	let store: Store<VechileDetailsState, VechileDetailsAction>

	public init(store: Store<VechileDetailsState, VechileDetailsAction>) {
		self.store = store
	}

	public var body: some View {
		WithViewStore(self.store) { viewStore in
			VStack {
				ScrollView {
					VStack {
						Text("\(viewStore.vechilesD.make) \(viewStore.vechilesD.model)")
							.font(.title)
							.frame(maxWidth: .infinity, alignment: .leading)
							.padding(.vertical)
							.redacted(reason: viewStore.isLoading ? .placeholder : .init())

						Text("VRM: " + viewStore.vechilesD.vrm + "\nDisplayVariant: " + viewStore.vechilesD.displayVariant)
							.frame(maxWidth: .infinity, alignment: .leading)
							.redacted(reason: viewStore.isLoading ? .placeholder : .init())

						Text("Mileage: \(viewStore.vechilesD.mileage)")
							.frame(maxWidth: .infinity, alignment: .leading)
							.redacted(reason: viewStore.isLoading ? .placeholder : .init())
					}
					.font(.body)
					.padding()
					.frame(maxWidth: .infinity, alignment: .leading)

					LazyVGrid(columns: gridItemLayout) {
						ForEach(viewStore.vechilesD.manufacturerFeatures, id: \.self) { imageString in
							Text(imageString)
							VechileAsyncImageView(
								url: URL(string: imageString),
								isLoading: viewStore.isLoading
							)
						}

					}

					VechileAsyncImageView(
						url: URL(string: viewStore.vechilesD.internal360),
						isLoading: viewStore.isLoading
					)

					LazyVGrid(columns: gridItemLayout) {
						
						ForEach(viewStore.imageGallery, id: \.self) { image in
							VechileAsyncImageView(
								url: URL(string: image.medium),
								isLoading: viewStore.isLoading
							)
						}

					}

				}
			}
			.onAppear { viewStore.send(.onAppear) }
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarTitle("\(viewStore.vechilesD.make) \(viewStore.vechilesD.model)")
		}

	}
}

struct VechileDetailsView_Previews: PreviewProvider {
	static var previews: some View {
		VechileDetailsView(
			store: Store(
				initialState: VechileDetailsState.mockData,
				reducer: vechileDetailsReducer,
				environment: VechileDetailsEnvironment.mock
			)
		)
	}
}
