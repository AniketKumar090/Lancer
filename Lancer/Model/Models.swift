import Foundation

struct LinkItem: Identifiable,Codable {
    var id = UUID()
    let name: String
    let url: String
    let icon: String
    var price: String?
}

struct Brand: Identifiable {
    let id = UUID()
    let name: String
    let link: String
}

struct DealLink: Identifiable {
    let id = UUID()
    let brandName: String
    let websiteUrl: String
    let iconName: String
}
