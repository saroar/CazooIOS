import Foundation

// MARK: - Images
public struct Images: Codable, Equatable, Hashable {
	public let main: Main

	public init(main: Main) {
		self.main = main
	}
}

// MARK: - Main
public struct Main: Codable, Equatable, Hashable {
	public let url: String

	public init(url: String) {
		self.url = url
	}
}
