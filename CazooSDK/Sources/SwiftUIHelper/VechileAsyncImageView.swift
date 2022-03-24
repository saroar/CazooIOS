import SwiftUI

public struct VechileAsyncImageView: View {

	public let url: URL?
	public let isLoading: Bool?

	public init(url: URL? = nil, isLoading: Bool? = false) {
		self.url = url
		self.isLoading = isLoading
	}

	public var body: some View {
		AsyncImage(url: url) { phase in
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
						//.opacity(viewStore.isLoading ? 1 : 0)
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
