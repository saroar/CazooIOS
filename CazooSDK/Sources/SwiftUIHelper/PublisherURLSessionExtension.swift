import Foundation
import Combine
import Models

public extension Publisher where Output == (data: Data, response: HTTPURLResponse), Failure == CazooError {

	func assumeHTTP() -> AnyPublisher<(data: Data, response: HTTPURLResponse), CazooError> {
		tryMap { (data: Data, response: URLResponse) in
			guard let http = response as? HTTPURLResponse else { throw CazooError.message("Non-HTTP response received") }
			return (data, http)
		}
		.mapError { error in
			if error is CazooError {
				return error as! CazooError
			} else {
				return CazooError.message("Network error \(error)")
			}
		}
		.eraseToAnyPublisher()
	}

}

public extension Publisher where Output == (data: Data, response: HTTPURLResponse), Failure == CazooError {
	func responseData() -> AnyPublisher<Data, CazooError> {
		tryMap { (data: Data, response: HTTPURLResponse) -> Data in
			switch response.statusCode {
			case 200...299: return data
			case 400...499: throw CazooError.message("\(#line) error with status code: \(response.statusCode)")
			case 500...599: throw CazooError.message("\(#line) error with status code: \(response.statusCode)")
			default:
				throw CazooError.message("\(#line) error with status code: \(response.statusCode)")
			}
		}
		.mapError { $0 as! CazooError }
		.eraseToAnyPublisher()
	}
}

public extension Publisher where Output == (data: Data, response: URLResponse) {

	func assumeHTTP() -> AnyPublisher<(data: Data, response: HTTPURLResponse), CazooError> {
		tryMap { (data: Data, response: URLResponse) in
			guard let http = response as? HTTPURLResponse else { throw CazooError.message("Non-HTTP response received") }
			return (data, http)
		}
		.mapError { error in
			if error is CazooError {
				return error as! CazooError
			} else {
				return CazooError.message("Network error \(error)")
			}
		}
		.eraseToAnyPublisher()
	}

}


public extension Publisher where Output == Data, Failure == CazooError {
	func decoding<D: Decodable, Decoder: TopLevelDecoder>(
		_ type: D.Type,
		decoder: Decoder
	) -> AnyPublisher<D, CazooError> where Decoder.Input == Data {
		decode(type: D.self, decoder: decoder)
			.mapError { error in
				if error is DecodingError {
					return CazooError.message("decodingError \(error as! DecodingError)")
				} else {
					return error as! CazooError
				}

			}
			.eraseToAnyPublisher()
	}
}
