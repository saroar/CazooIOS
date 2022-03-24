
import Foundation

// MARK: - VechileDeatails
public struct VechileDeatails: Codable, Equatable, Hashable {
	public let vin: String
	public let isSold: Bool
	public let state: String
	public var manufacturerFeatures: [String] = []
	public let manufacturerSpecs: [ManufacturerSpec]
	public let verifiedFeatures: [VerifiedFeature]
	public let summaryAttributes: [Consumption]
	public let runningCosts: RunningCosts
	public let keyFeatures: [KeyFeature]
	public let vehicleHistory: VehicleHistory
	public let imageGallery: [ImageGallery]
	public let featuresGallery, imperfectionsGallery: [SGallery]
	public let closeDoors360, openDoors360: [Doors360]
	public let internal360: String
	public let serviceHistoryDocumentationFound: Bool
	public let serviceHistory: [ServiceHistory]
	public let createdAt, id, make, makeIdentifier: String
	public let model, modelIdentifier: String
	public let modelYear: Int
	public let displayVariant: String
	public let mileage, registrationYear: Int
	public let vrm: String
	public let isForSubscription, isForPurchase: Bool
	public let fuelType: FuelType
	public let images: Images
	public let isPromoted: Bool
	public let odometerReading: Odometer
	public let tradingMarket, vehicleType, gearbox: String
	public let pricing: Pricing
	public let consumption: [Consumption]
	public let vatScheme: VatScheme
	public let isComingSoon: Bool

	public init(vin: String, isSold: Bool, state: String, manufacturerFeatures: [String] = [], manufacturerSpecs: [ManufacturerSpec], verifiedFeatures: [VerifiedFeature], summaryAttributes: [Consumption], runningCosts: RunningCosts, keyFeatures: [KeyFeature], vehicleHistory: VehicleHistory, imageGallery: [ImageGallery], featuresGallery: [SGallery], imperfectionsGallery: [SGallery], closeDoors360: [Doors360], openDoors360: [Doors360], internal360: String, serviceHistoryDocumentationFound: Bool, serviceHistory: [ServiceHistory], createdAt: String, id: String, make: String, makeIdentifier: String, model: String, modelIdentifier: String, modelYear: Int, displayVariant: String, mileage: Int, registrationYear: Int, vrm: String, isForSubscription: Bool, isForPurchase: Bool, fuelType: FuelType, images: Images, isPromoted: Bool, odometerReading: Odometer, tradingMarket: String, vehicleType: String, gearbox: String, pricing: Pricing, consumption: [Consumption], vatScheme: VatScheme, isComingSoon: Bool) {
		self.vin = vin
		self.isSold = isSold
		self.state = state
		self.manufacturerFeatures = manufacturerFeatures
		self.manufacturerSpecs = manufacturerSpecs
		self.verifiedFeatures = verifiedFeatures
		self.summaryAttributes = summaryAttributes
		self.runningCosts = runningCosts
		self.keyFeatures = keyFeatures
		self.vehicleHistory = vehicleHistory
		self.imageGallery = imageGallery
		self.featuresGallery = featuresGallery
		self.imperfectionsGallery = imperfectionsGallery
		self.closeDoors360 = closeDoors360
		self.openDoors360 = openDoors360
		self.internal360 = internal360
		self.serviceHistoryDocumentationFound = serviceHistoryDocumentationFound
		self.serviceHistory = serviceHistory
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
		self.consumption = consumption
		self.vatScheme = vatScheme
		self.isComingSoon = isComingSoon
	}
}


// MARK: - Doors360
public struct Doors360: Codable, Equatable, Hashable {
	public let original, small, medium, large: String

	public init(original: String, small: String, medium: String, large: String) {
		self.original = original
		self.small = small
		self.medium = medium
		self.large = large
	}
}

// MARK: - Consumption
public struct Consumption: Codable, Equatable, Hashable {
	public let identifier, displayLabel, displayValue: String

	public init(identifier: String, displayLabel: String, displayValue: String) {
		self.identifier = identifier
		self.displayLabel = displayLabel
		self.displayValue = displayValue
	}
}

// MARK: - SGallery
public struct SGallery: Codable, Equatable, Hashable {
	public let coordinates: Coordinates
	public let sGalleryDescription: String
	public let image, parentImage: ImageGallery
	public let title: String

	enum CodingKeys: String, CodingKey {
		case coordinates
		case sGalleryDescription = "description"
		case image, parentImage, title
	}

	public init(coordinates: Coordinates, sGalleryDescription: String, image: ImageGallery, parentImage: ImageGallery, title: String) {
		self.coordinates = coordinates
		self.sGalleryDescription = sGalleryDescription
		self.image = image
		self.parentImage = parentImage
		self.title = title
	}
}

// MARK: - Coordinates
public struct Coordinates: Codable, Equatable, Hashable {
	public let x, y: Double

	public init(x: Double, y: Double) {
		self.x = x
		self.y = y
	}
}

// MARK: - ImageGallery
public struct ImageGallery: Codable, Equatable, Hashable {
	public let small, medium, large: String

	public init(small: String, medium: String, large: String) {
		self.small = small
		self.medium = medium
		self.large = large
	}
}

// MARK: - KeyFeature
public struct KeyFeature: Codable, Equatable, Hashable {
	public let identifier, displayValue: String

	public init(identifier: String, displayValue: String) {
		self.identifier = identifier
		self.displayValue = displayValue
	}
}

// MARK: - ManufacturerSpec
public struct ManufacturerSpec: Codable, Equatable, Hashable {
	public let identifier, displayLabel: String
	public let displayValue: [Consumption]

	public init(identifier: String, displayLabel: String, displayValue: [Consumption]) {
		self.identifier = identifier
		self.displayLabel = displayLabel
		self.displayValue = displayValue
	}
}

// MARK: - Odometer
public struct Odometer: Codable, Equatable, Hashable  {
	public let unit: String
	public let value: Int

	public init(unit: String, value: Int) {
		self.unit = unit
		self.value = value
	}
}

// MARK: - Lowest
public struct Lowest: Codable, Equatable, Hashable {
	public let centAmount: Int
	public let currencyCode: String
	public let value: Int
	public let type: String

	public init(centAmount: Int, currencyCode: String, value: Int, type: String) {
		self.centAmount = centAmount
		self.currencyCode = currencyCode
		self.value = value
		self.type = type
	}
}

// MARK: - RunningCosts
public struct RunningCosts: Codable, Equatable, Hashable {
	public let insuranceGroup: Int
	public let insuranceCostPerYear: FullPrice
	public let fuelConsumptionMpg: Double
	public let fuelConsumptionCostPerWeek: FuelConsumptionCostPerWeek

	public init(insuranceGroup: Int, insuranceCostPerYear: FullPrice, fuelConsumptionMpg: Double, fuelConsumptionCostPerWeek: FuelConsumptionCostPerWeek) {
		self.insuranceGroup = insuranceGroup
		self.insuranceCostPerYear = insuranceCostPerYear
		self.fuelConsumptionMpg = fuelConsumptionMpg
		self.fuelConsumptionCostPerWeek = fuelConsumptionCostPerWeek
	}
}

// MARK: - FuelConsumptionCostPerWeek
public struct FuelConsumptionCostPerWeek: Codable, Equatable, Hashable {
	public let centAmount: Double
	public let currencyCode: String
	public let value: Double

	public init(centAmount: Double, currencyCode: String, value: Double) {
		self.centAmount = centAmount
		self.currencyCode = currencyCode
		self.value = value
	}
}

// MARK: - ServiceHistory
public struct ServiceHistory: Codable, Equatable, Hashable {
	public let franchiseType, source, date: String
	public let odometer: Odometer

	public init(franchiseType: String, source: String, date: String, odometer: Odometer) {
		self.franchiseType = franchiseType
		self.source = source
		self.date = date
		self.odometer = odometer
	}
}

// MARK: - VatScheme
public struct VatScheme: Codable, Equatable, Hashable {
	public let key, label: String

	public init(key: String, label: String) {
		self.key = key
		self.label = label
	}
}

// MARK: - VehicleHistory
public struct VehicleHistory: Codable, Equatable, Hashable {
	public let registrationDate: String
	public let numberOfPreviousKeepers: Int
	public let motHistory: [MotHistory]

	public init(registrationDate: String, numberOfPreviousKeepers: Int, motHistory: [MotHistory]) {
		self.registrationDate = registrationDate
		self.numberOfPreviousKeepers = numberOfPreviousKeepers
		self.motHistory = motHistory
	}
}

// MARK: - MotHistory
public struct MotHistory: Codable, Equatable, Hashable {
	public let testDate, expiryDate: String?
	public let hasPassed: Bool
	public let mileage: Int
	public let failures: String?
	public let advisories: String?
	public let minors: String?

	public init(testDate: String, expiryDate: String, hasPassed: Bool, mileage: Int, failures: String? = nil, advisories: String? = nil, minors: String? = nil) {
		self.testDate = testDate
		self.expiryDate = expiryDate
		self.hasPassed = hasPassed
		self.mileage = mileage
		self.failures = failures
		self.advisories = advisories
		self.minors = minors
	}
}

// MARK: - VerifiedFeature
public struct VerifiedFeature: Codable, Equatable, Hashable {
	public let identifier, displayLabel: String
	public let displayValue: Bool
	public let location: String

	public init(identifier: String, displayLabel: String, displayValue: Bool, location: String) {
		self.identifier = identifier
		self.displayLabel = displayLabel
		self.displayValue = displayValue
		self.location = location
	}
}
