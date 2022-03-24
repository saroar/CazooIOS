import Foundation

// MARK: - Welcome
public struct Vechiles: Codable, Equatable, Hashable, Identifiable {
	public var id: UUID? = UUID()
	public let results: [Result]
	public let filters: Filters
	public let pagination: Pagination

	public init(results: [Result] = [], filters: Filters = .init(), pagination: Pagination = .byDefault) {
		self.results = results
		self.filters = filters
		self.pagination = pagination
	}
}

// MARK: - CombinedConsumptionMpg
public struct CombinedConsumptionMpg: Codable, Equatable, Hashable {
	public let value: Double
	public let displayValue: String
	public let unit: String
	public let formattedDisplayValue: String

	public init(value: Double, displayValue: String, unit: String, formattedDisplayValue: String) {
		self.value = value
		self.displayValue = displayValue
		self.unit = unit
		self.formattedDisplayValue = formattedDisplayValue
	}
}

// MARK: - Pagination
public struct Pagination: Codable, Equatable, Hashable {
	public let currentPageIndex, requestPageSize, totalPages, totalItems: Int

	public init(currentPageIndex: Int, requestPageSize: Int, totalPages: Int, totalItems: Int) {
		self.currentPageIndex = currentPageIndex
		self.requestPageSize = requestPageSize
		self.totalPages = totalPages
		self.totalItems = totalItems
	}
}

extension Pagination {
	public static let byDefault: Pagination = .init(currentPageIndex: 1, requestPageSize: 48, totalPages: 194, totalItems: 9275)
}

// MARK: - Result
public struct Result: Codable, Equatable, Hashable, Identifiable {
	public let createdAt, id, make, makeIdentifier: String
	public let model, modelIdentifier: String
	public let modelYear: Int
	public let displayVariant: String
	public let mileage, registrationYear: Int
	public let vrm: String?
	public let isForSubscription, isForPurchase: Bool
	public let fuelType: FuelType?
	public let images: Images
	public let isPromoted: Bool
	public let odometerReading: OdometerReading
	public let tradingMarket: String
	public let vehicleType: String
	public let gearbox: String
	public let pricing: Pricing

	public init(createdAt: String, id: String, make: String, makeIdentifier: String, model: String, modelIdentifier: String, modelYear: Int, displayVariant: String, mileage: Int, registrationYear: Int, vrm: String?, isForSubscription: Bool, isForPurchase: Bool, fuelType: FuelType? = nil, images: Images, isPromoted: Bool, odometerReading: OdometerReading, tradingMarket: String, vehicleType: String, gearbox: String, pricing: Pricing) {
		self.createdAt = createdAt
		self.id = id
		self.make = make
		self.makeIdentifier = makeIdentifier
		self.model = model
		self.modelIdentifier = modelIdentifier
		self.modelYear = modelYear
		self.displayVariant = displayVariant
		self.mileage = mileage
		self.registrationYear = registrationYear
		self.vrm = vrm
		self.isForSubscription = isForSubscription
		self.isForPurchase = isForPurchase
		self.fuelType = fuelType
		self.images = images
		self.isPromoted = isPromoted
		self.odometerReading = odometerReading
		self.tradingMarket = tradingMarket
		self.vehicleType = vehicleType
		self.gearbox = gearbox
		self.pricing = pricing
	}
}

// MARK: - OdometerReading
public struct OdometerReading: Codable, Equatable, Hashable {
	public let unit: String
	public let value: Int

	public init(unit: String, value: Int) {
		self.unit = unit
		self.value = value
	}
}

// MARK: - FuelType
public struct FuelType: Codable, Equatable, Hashable {
	public let fuelTypeDescription: String
	public let isEcoFriendly, isPlugin: Bool

	enum CodingKeys: String, CodingKey {
		case fuelTypeDescription = "description"
		case isEcoFriendly, isPlugin
	}

	public init(fuelTypeDescription: String, isEcoFriendly: Bool, isPlugin: Bool) {
		self.fuelTypeDescription = fuelTypeDescription
		self.isEcoFriendly = isEcoFriendly
		self.isPlugin = isPlugin
	}
}
