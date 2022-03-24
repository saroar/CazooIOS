import ComposableArchitecture
import Models
import XCTest

@testable import VechilesFeature

class VechilesFeatureTests: XCTestCase {

	let scheduler = DispatchQueue.test

	func testVechilesFetchRequest() {
		let state = VechilesState(isLoading: true)

		let store = TestStore(
			initialState: state,
			reducer: vechilesReducer,
			environment: VechilesEnvironment(
				mainQueue: self.scheduler.eraseToAnyScheduler(),
				vechilesClient: .mockData
			)
		)

		store.send(.onAppear)
		self.scheduler.advance(by: 1)
		store.receive(.vechilesResponse(.success(.mockData))) {
			$0.isLoading = false
			$0.vechiles = VechilesState.mockData.vechiles
		}

	}
}
