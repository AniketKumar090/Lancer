import SwiftUI


class DealsViewModel: ObservableObject {
    @Published var selectedBrand: String?
    @Published var deals = [
        DealLink(brandName: "APPLE", websiteUrl: "www.mercededs.com", iconName: "apple.logo"),
        DealLink(brandName: "BMW", websiteUrl: "www.bmw.com", iconName: "car.fill"),
        DealLink(brandName: "CARChalao", websiteUrl: "www.carchalao.com", iconName: "car.circle"),
        DealLink(brandName: "Muscle Blaze", websiteUrl: "www.rocked.com", iconName: "bolt.fill")
    ]
}

class CouponStore {
    
    private static let couponKey = "savedCoupons"
    
    static func saveCoupons(_ coupons: [LinkItem]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(coupons) {
            UserDefaults.standard.set(encoded, forKey: couponKey)
        }
    }
    
    static func loadCoupons() -> [LinkItem] {
        if let savedData = UserDefaults.standard.data(forKey: couponKey) {
            let decoder = JSONDecoder()
            if let decodedCoupons = try? decoder.decode([LinkItem].self, from: savedData) {
                return decodedCoupons
            }
        }
        return [] 
    }
}
