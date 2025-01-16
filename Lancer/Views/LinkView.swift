import SwiftUI

struct LinkView: View {
    @StateObject private var viewModel = DealsViewModel()
    @State private var showCopiedAlert = false
    @State private var copiedUrl: String? = nil // Store the copied URL here
    @State private var showFullScreenContent = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(alignment: .center) {
                    Text("Links")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray.opacity(0.5))
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(viewModel.deals) { deal in
                                DealLinkRow(deal: deal) {
                                    // Long press action
                                    UIPasteboard.general.string = deal.websiteUrl
                                    copiedUrl = deal.websiteUrl // Store the copied URL for later use
                                    showCopiedAlert = true
                                }
                                .onTapGesture {
                                    showFullScreenContent = true
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .background(colorScheme == .dark ? Color.black : Color.black)
            .alert("Link Copied!", isPresented: $showCopiedAlert) {
                Button("OK", role: .cancel) { }
            }
            .fullScreenCover(isPresented: $showFullScreenContent) {
                // You can use `copiedUrl` here to pass the copied URL to ContentView
                ContentView(copiedUrl: copiedUrl)
            }
        }
    }
}

#Preview{
    InfluencerProfileView()
}
