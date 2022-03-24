import SwiftUI
import ComposableArchitecture
import Models
import VechileDetailsFeature

public enum VechilesAction: Equatable, Hashable {
	case onAppear
	case vechilesResponse(Swift.Result<Vechiles, CazooError>)
	case vechile(id: String, action: VechileRowAction)
	case vechileDetailsTapped(Result)
	case vechileDetails(VechileDetailsAction)
	case vechileDetailsView(isNavigate: Bool)
	case isCar(isAvilable: Bool)
	case alertDismissed
}
