//
//  CazooApp.swift
//  Cazoo
//
//  Created by Saroar on 22.03.2022.
//

import SwiftUI
import AppFeature
import ComposableArchitecture

@main
struct CazooApp: App {
	let store: Store<AppState, AppAction> = Store(
		initialState: .init(),
		reducer: appReducer,
		environment: AppEnvironment.live
	)

	var body: some Scene {
		WindowGroup {
			AppView(store: store)
		}
	}
}
