import SwiftUI

struct LinkRowCoupons: View {
    let link: LinkItem
    @Binding var customURL: String
    @Binding var customLabel: String
    @Binding var customPrice: String
    @State private var showDetails = false
    
    var body: some View {
        HStack(spacing: 12) {
            
            Group {
                switch link.name.lowercased() {
                    case "amazon":
                        Image("amazon")
                            .resizable()
                    case "myntra":
                        Image("myntra")
                            .resizable()
                    case "flipkart":
                        Image("flipkart")
                            .resizable()
                    case "meesho":
                        Image("meesho")
                            .resizable()
                    default:
                        Image(systemName: "photo.fill")
                            .resizable()
                }
            }
            .frame(width: 40, height: 40)
            .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(link.name)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                if let price = link.price {
                    Text(price)
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                }
            }
            
            Spacer()
            
            HStack(spacing: 16) {
            
                Image(systemName: "eye.fill")
                    .foregroundStyle(.white)
                   
                
                Image(systemName: "ellipsis")
                    .foregroundStyle(.white)
                    .rotationEffect(Angle(degrees: 90))
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(RoundedRectangle(cornerRadius: 12).stroke(Color(.gray), lineWidth: 1))
        .cornerRadius(12)
        .contentShape(Rectangle())
        .onTapGesture {
            customURL = link.url
            customLabel = link.name
            customPrice = link.price?.replacingOccurrences(of: "Rs ", with: "") ?? ""
            showDetails.toggle()
        }
        .sheet(isPresented: $showDetails) {
            LinkFormView(
                customURL: $customURL,
                customLabel: $customLabel,
                customPrice: $customPrice,
                links: .constant([]),
                isViewingDetails: true
            ).presentationDetents([.fraction(0.45)])
        }
    }
}

