import Foundation

struct ESIMItem: Identifiable {
    let id = UUID()
    let country: String
    let provider: String
    let dataAmount: String
    let price: Double
    let validityPeriod: String
}
