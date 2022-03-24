import Foundation
import Models


public typealias APIKey = String

// https://www.cazoo.co.uk/api/search
public enum Constants {
	public static let scheme = "https"
	public static let host = "www.cazoo.co.uk"
	public static let version = "/api/"
}


public enum Method: String {
	case GET
}

public final class NetworkClient {
	public static let shared = NetworkClient()

	public init() {}

	private func makeComponents() -> URLComponents {
		var components = URLComponents()
		components.scheme = Constants.scheme
		components.host = Constants.host
		components.path = Constants.version

		return components
	}

	public func featchVechilesRequest(httpMethod: Method = .GET) -> URLRequest? {

		guard let url = URL(string: "https://www.cazoo.co.uk/api/search") else {
			return nil
		}

		var request = URLRequest(url: url)
		request.httpMethod = httpMethod.rawValue

		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		return request

	}

	public func featchVechileDetailsRequest(productID: String, httpMethod: Method = .GET) -> URLRequest? {

		guard let url = URL(string: "https://www.cazoo.co.uk/api/vehicles/\(productID)") else {
			return nil
		}

		var request = URLRequest(url: url)
		request.httpMethod = httpMethod.rawValue

		request.setValue("application/json", forHTTPHeaderField: "Content-Type")

		return request

	}

}
