import SwiftUI
import ComposableArchitecture
import Models

public struct VechileDetailsState: Equatable, Hashable {
	public var productId: String
	public var vechilesD: VechileDeatails
	public var isLoading = false
	public var imageGallery: [ImageGallery] = []

	public init(
		productId: String,
		vechilesD: VechileDeatails,
		isLoading: Bool = false,
		imageGallery: [ImageGallery] = []
	) {
		self.productId = productId
		self.vechilesD = vechilesD
		self.isLoading = isLoading
		self.imageGallery = imageGallery
	}
}

extension VechileDetailsState {
	static let mockData: VechileDetailsState = .init(productId: "43e483e6-cbbb-5059-b8ec-51a0eef5af37", vechilesD: .mockData, isLoading: true, imageGallery: ImageGallery.mockDatas)
}
