import SwiftUI
import ComposableArchitecture
import Models
import Combine
import VechilesClient

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

						Text("VRM: " + viewStore.vechilesD.vrm + "\nDisplayVariant: " + viewStore.vechilesD.displayVariant)
							.frame(maxWidth: .infinity, alignment: .leading)
						Text("Mileage: \(viewStore.vechilesD.mileage)")
							.frame(maxWidth: .infinity, alignment: .leading)
					}
					.font(.body)
					.padding()
					.frame(maxWidth: .infinity, alignment: .leading)

					LazyVGrid(columns: gridItemLayout) {
						ForEach(viewStore.vechilesD.manufacturerFeatures, id: \.self) { image in
							Text(image)
							AsyncImage(url: URL(string: image)) { phase in
								switch phase {
								case .empty:
									Image(systemName: "car")
										.resizable()
										.scaledToFit()
										.padding(40)
										.background(Color.gray.opacity(0.2))
										.overlay(
											ProgressView()
											.padding()
											.background(Color.white)
											.cornerRadius(10)
											.shadow(radius: 10)
											.opacity(viewStore.isLoading ? 1 : 0)
										)

								case .success(let image):
									image
										.resizable()
										.scaledToFill()
								case .failure(_):
									Image(systemName: "exclamationmark.icloud")
										.resizable()
										.scaledToFit()
								@unknown default:
									Image(systemName: "exclamationmark.icloud")
								}
							}
							.frame(maxWidth: .infinity, alignment: .leading)
						}

					}

					AsyncImage(url: URL(string: viewStore.vechilesD.internal360)) { phase in
						switch phase {
						case .empty:
							Image(systemName: "car")
								.resizable()
								.scaledToFit()
								.padding(40)
								.background(Color.gray.opacity(0.2))
								.overlay(
									ProgressView()
									.padding()
									.background(Color.white)
									.cornerRadius(10)
									.shadow(radius: 10)
									.opacity(viewStore.isLoading ? 1 : 0)
								)

						case .success(let image):
							image
								.resizable()
								.scaledToFill()
						case .failure(_):
							Image(systemName: "exclamationmark.icloud")
								.resizable()
								.scaledToFit()
						@unknown default:
							Image(systemName: "exclamationmark.icloud")
						}
					}
					.frame(maxWidth: .infinity, alignment: .leading)


					LazyVGrid(columns: gridItemLayout) {
						ForEach(viewStore.imageGallery, id: \.self) { image in
							AsyncImage(url: URL(string: image.medium)) { phase in
								switch phase {
								case .empty:
									Image(systemName: "car")
										.resizable()
										.scaledToFit()
										.padding(40)
										.background(Color.gray.opacity(0.2))
										.overlay(
											ProgressView()
											.padding()
											.background(Color.white)
											.cornerRadius(10)
											.shadow(radius: 10)
											.opacity(viewStore.isLoading ? 1 : 0)
										)

								case .success(let image):
									image
										.resizable()
										.scaledToFill()
								case .failure(_):
									Image(systemName: "exclamationmark.icloud")
										.resizable()
										.scaledToFit()
								@unknown default:
									Image(systemName: "exclamationmark.icloud")
								}
							}
							.frame(maxWidth: .infinity, alignment: .leading)
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
