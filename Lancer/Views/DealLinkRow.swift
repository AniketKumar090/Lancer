import SwiftUI

struct DealLinkRow: View {
    let deal: DealLink
    let onLongPress: () -> Void
    @State private var showListView: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: deal.iconName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text(deal.brandName)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(deal.websiteUrl)
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
            
            Spacer()
        }
        .padding()
        .cornerRadius(10)
        .shadow(radius: 2)
        .onLongPressGesture {
            onLongPress()
        }.frame(height: 70)
        
    }
}
