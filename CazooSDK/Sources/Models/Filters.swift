
// MARK: - Filters
public struct Filters: Codable, Equatable, Hashable {
	public let bodyType, driveType: [BodyType]
	public let colour: [Colour]
	public let gearbox, fuelType: [BodyType]
	public let minMileage, maxMileage, minPrice, maxPrice: [CombinedConsumptionMpg]
	public let minMonthlyPrice, maxMonthlyPrice, minSubscriptionMonthlyPrice, maxSubscriptionMonthlyPrice: [CombinedConsumptionMpg]
	public let verifiedFeatures: [BodyType]
	public let minManufacturedYear, maxManufacturedYear, co2EmissionsGPerKM: [Co2EmissionsGPerKM]
	public let runningCosts: [BodyType]
	public let minEngineSizeLitres, maxEngineSizeLitres: [CombinedConsumptionMpg]
	public let numDoors, numSeats, ownershipType: [BodyType]
	public let combinedConsumptionMpg, financeDeposit: [CombinedConsumptionMpg]
	public let financeLengthOfTerm: [Co2EmissionsGPerKM]
	public let make: [BodyType]

	enum CodingKeys: String, CodingKey {
		case bodyType, driveType, colour, gearbox, fuelType, minMileage, maxMileage, minPrice, maxPrice, minMonthlyPrice, maxMonthlyPrice, minSubscriptionMonthlyPrice, maxSubscriptionMonthlyPrice, verifiedFeatures, minManufacturedYear, maxManufacturedYear
		case co2EmissionsGPerKM = "co2EmissionsGPerKm"
		case runningCosts, minEngineSizeLitres, maxEngineSizeLitres, numDoors, numSeats, ownershipType, combinedConsumptionMpg, financeDeposit, financeLengthOfTerm, make
	}

	public init(
		bodyType: [BodyType] = [],
		driveType: [BodyType] = [],
		colour: [Colour] = [],
		gearbox: [BodyType] = [],
		fuelType: [BodyType] = [],
		minMileage: [CombinedConsumptionMpg] = [],
		maxMileage: [CombinedConsumptionMpg] = [],
		minPrice: [CombinedConsumptionMpg] = [],
		maxPrice: [CombinedConsumptionMpg] = [],
		minMonthlyPrice: [CombinedConsumptionMpg] = [],
		maxMonthlyPrice: [CombinedConsumptionMpg] = [],
		minSubscriptionMonthlyPrice: [CombinedConsumptionMpg] = [],
		maxSubscriptionMonthlyPrice: [CombinedConsumptionMpg] = [],
		verifiedFeatures: [BodyType] = [],
		minManufacturedYear: [Co2EmissionsGPerKM] = [],
		maxManufacturedYear: [Co2EmissionsGPerKM] = [],
		co2EmissionsGPerKM: [Co2EmissionsGPerKM] = [],
		runningCosts: [BodyType] = [],
		minEngineSizeLitres: [CombinedConsumptionMpg] = [],
		maxEngineSizeLitres: [CombinedConsumptionMpg] = [],
		numDoors: [BodyType] = [],
		numSeats: [BodyType] = [],
		ownershipType: [BodyType] = [],
		combinedConsumptionMpg: [CombinedConsumptionMpg] = [],
		financeDeposit: [CombinedConsumptionMpg] = [],
		financeLengthOfTerm: [Co2EmissionsGPerKM] = [],
		make: [BodyType] = []
	) {
		self.bodyType = bodyType
		self.driveType = driveType
		self.colour = colour
		self.gearbox = gearbox
		self.fuelType = fuelType
		self.minMileage = minMileage
		self.maxMileage = maxMileage
		self.minPrice = minPrice
		self.maxPrice = maxPrice
		self.minMonthlyPrice = minMonthlyPrice
		self.maxMonthlyPrice = maxMonthlyPrice
		self.minSubscriptionMonthlyPrice = minSubscriptionMonthlyPrice
		self.maxSubscriptionMonthlyPrice = maxSubscriptionMonthlyPrice
		self.verifiedFeatures = verifiedFeatures
		self.minManufacturedYear = minManufacturedYear
		self.maxManufacturedYear = maxManufacturedYear
		self.co2EmissionsGPerKM = co2EmissionsGPerKM
		self.runningCosts = runningCosts
		self.minEngineSizeLitres = minEngineSizeLitres
		self.maxEngineSizeLitres = maxEngineSizeLitres
		self.numDoors = numDoors
		self.numSeats = numSeats
		self.ownershipType = ownershipType
		self.combinedConsumptionMpg = combinedConsumptionMpg
		self.financeDeposit = financeDeposit
		self.financeLengthOfTerm = financeLengthOfTerm
		self.make = make
	}
}

// MARK: - BodyType
public struct BodyType: Codable, Equatable, Hashable {
	public let identifier, displayValue: String

	public init(identifier: String, displayValue: String) {
		self.identifier = identifier
		self.displayValue = displayValue
	}
}

// MARK: - Co2EmissionsGPerKM
public struct Co2EmissionsGPerKM: Codable, Equatable, Hashable {
	public let value: Int

	public init(value: Int) {
		self.value = value
	}
}

// MARK: - Colour
public struct Colour: Codable, Equatable, Hashable {
	public let identifier, displayValue, background: String

	public init(identifier: String, displayValue: String, background: String) {
		self.identifier = identifier
		self.displayValue = displayValue
		self.background = background
	}
}


extension Filters {
	static let mock: Filters = .init(bodyType: [], driveType: [], colour: [], gearbox: [], fuelType: [], minMileage: [], maxMileage: [], minPrice: [], maxPrice: [], minMonthlyPrice: [], maxMonthlyPrice: [], minSubscriptionMonthlyPrice: [], maxSubscriptionMonthlyPrice: [], verifiedFeatures: [], minManufacturedYear: [], maxManufacturedYear: [], co2EmissionsGPerKM: [], runningCosts: [], minEngineSizeLitres: [], maxEngineSizeLitres: [], numDoors: [], numSeats: [], ownershipType: [], combinedConsumptionMpg: [], financeDeposit: [], financeLengthOfTerm: [], make: [])

}
