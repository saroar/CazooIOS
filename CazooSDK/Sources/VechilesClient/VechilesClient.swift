import SwiftUI
import ComposableArchitecture
import Models
import Combine
import NetworkClient
import SwiftUIHelper

public struct VechilesClient {
	public var vechiles: () -> Effect<Vechiles, CazooError>
	public var vechileDetails: (String) -> Effect<VechileDeatails, CazooError>

	public init(
		vechiles: @escaping () -> Effect<Vechiles, CazooError>,
		vechileDetails: @escaping (String) -> Effect<VechileDeatails, CazooError>
	) {
		self.vechiles = vechiles
		self.vechileDetails = vechileDetails
	}
}

extension VechilesClient {
	public static var live: VechilesClient = .init(
		vechiles: {
			guard let request = NetworkClient.shared.featchVechilesRequest() else {
				return Effect(value: Vechiles())
			}

			let decoder = JSONDecoder()
			let dateDecodingStategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
			let keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys

			decoder.dateDecodingStrategy = dateDecodingStategy
			decoder.keyDecodingStrategy = keyDecodingStrategy

			return URLSession.shared.dataTaskPublisher(for: request)
				.assumeHTTP()
				.responseData()
				.decoding(Vechiles.self, decoder: decoder)
				.catch { (error: CazooError) -> AnyPublisher<Vechiles, CazooError> in
					return Fail(error: error).eraseToAnyPublisher()
				}
				.receive(on: DispatchQueue.main)
				.eraseToEffect()
		},

		vechileDetails: { productID in
			guard let request = NetworkClient.shared.featchVechileDetailsRequest(productID: productID) else {
				return Effect(value: VechileDeatails.emptyData)
			}

			let decoder = JSONDecoder()
			let dateDecodingStategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
			let keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys

			decoder.dateDecodingStrategy = dateDecodingStategy
			decoder.keyDecodingStrategy = keyDecodingStrategy

			return URLSession.shared.dataTaskPublisher(for: request)
				.assumeHTTP()
				.responseData()
				.decoding(VechileDeatails.self, decoder: decoder)
				.catch { (error: CazooError) -> AnyPublisher<VechileDeatails, CazooError> in
					return Fail(error: error).eraseToAnyPublisher()
				}
				.receive(on: DispatchQueue.main)
				.eraseToEffect()
		}
	)

	public static var jsonToDataMock: VechilesClient = .init(
		vechiles: {
			Effect(value: Vechiles.jsonToData)
				.receive(on: DispatchQueue.immediate)
				.eraseToEffect()
		},

		vechileDetails: { _ in
			Effect(value: VechileDeatails.mockData)
				.receive(on: DispatchQueue.immediate)
				.eraseToEffect()
		}
	)

	public static var mockData: VechilesClient = .init(
		vechiles: {
			Effect(value: Vechiles.mockData)
				.eraseToEffect()
		},

		vechileDetails: { _ in
			Effect(value: VechileDeatails.mockData)
				.eraseToEffect()
		}
	)
}
