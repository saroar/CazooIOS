import SwiftUI
import ComposableArchitecture
import VechilesFeature

public struct AppState: Equatable {
	public init() {}
	public var vechilesState: VechilesState = .init()
}

public enum AppAction {
	case vechiles(VechilesAction)
}

public struct AppEnvironment {
	public init() {}
}

extension AppEnvironment {
	static public let live: AppEnvironment = .init()
}

public let appReducer = vechilesReducer.pullback(
	state: \.vechilesState,
	action: /AppAction.vechiles,
	environment: { _ in VechilesEnvironment.live }
).combined(with: Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
	switch action {
	case .vechiles: return .none
	}
	}
)

public struct AppView: View {
	let store: Store<AppState, AppAction>

	public init(store: Store<AppState, AppAction>) {
		self.store = store
	}

	public var body: some View {
		NavigationView {
			VechilesView(
				store: self.store.scope(
					state: \.vechilesState,
					action: AppAction.vechiles
				)
			)
		}
	}
}
