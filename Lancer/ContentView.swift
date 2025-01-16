import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var copiedUrl: String?
    private let predefinedLinks: [LinkItem] = [
        LinkItem(name: "Amazon", url: "amazon.com", icon: "amazon.logo", price: "Rs 5000"),
        LinkItem(name: "Myntra", url: "myntra.com", icon: "myntra.logo", price: "Rs 5000"),
        LinkItem(name: "Flipkart", url: "flipkart.com", icon: "flipkart.logo", price: "Rs 5000"),
        LinkItem(name: "Meesho", url: "meesho.com", icon: "meesho.logo", price: "Rs 5000")
    ]
    
    @State private var links: [LinkItem] = []
    
    var body: some View {
        LinksTabView(links: $links)
            .background(colorScheme == .dark ? Color.gray.opacity(0.25) : Color.black.opacity(0.85))
            .onAppear {
                loadLinks()
            }
    }
    
    private func loadLinks() {
            // Load saved links from UserDefaults
            let savedLinks = CouponStore.loadCoupons()
            
            // Combine predefined links and saved links, ensuring no duplicates
            var combinedLinks = predefinedLinks
            
            // Add saved links that are not already in the predefined list
            for link in savedLinks {
                if !combinedLinks.contains(where: { $0.url == link.url }) {
                    combinedLinks.append(link)
                }
            }
            
            // Set the combined list to the links state
            self.links = combinedLinks
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
