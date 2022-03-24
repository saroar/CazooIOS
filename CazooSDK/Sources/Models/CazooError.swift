import Foundation

public enum CazooError: Error, Hashable, Equatable {
	case message(String)
}

extension CazooError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case let .message(message):
			return message
		}
	}
}
