import Foundation

// MARK: - Pricing
public struct Pricing: Codable, Equatable, Hashable {
	public let fullPrice: FullPrice
	public let pcmPrice: PCMPrice?

	public init(fullPrice: FullPrice, pcmPrice: PCMPrice?) {
		self.fullPrice = fullPrice
		self.pcmPrice = pcmPrice
	}
}

//// MARK: - PCMPrice
public struct PCMPrice: Codable, Equatable, Hashable {
	public let pcp: FullPrice?
	public let hp, lowest: FullPrice

	public init(pcp: FullPrice?, hp: FullPrice, lowest: FullPrice) {
		self.pcp = pcp
		self.hp = hp
		self.lowest = lowest
	}
}

// MARK: - FullPrice
public struct FullPrice: Codable, Equatable, Hashable {
	public let centAmount: Int
	public let currencyCode: String
	public let value: Int
	public let type: String?

	public init(centAmount: Int, currencyCode: String, value: Int, type: String?) {
		self.centAmount = centAmount
		self.currencyCode = currencyCode
		self.value = value
		self.type = type
	}
}

public enum CurrencyCode: String, Codable, Equatable, Hashable {
	case eur = "EUR"
	case gbp = "GBP"
}

public enum TypeEnum: String, Codable, Equatable, Hashable {
	case hp = "hp"
	case pcp = "pcp"
}
