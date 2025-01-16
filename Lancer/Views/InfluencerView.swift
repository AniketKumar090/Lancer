import SwiftUI

struct InfluencerProfileView: View {
    @State private var selectedBrand: String?
    @State private var showBottomView: Bool = false
    @State private var showLinkView: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    let brands = [
        Brand(name: "Apple", link: "Mercede"),
        Brand(name: "BMW", link: "Orange"),
        Brand(name: "System", link: "jefje"),
        Brand(name: "Chalao", link: "Cars")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(brands) { brand in
                        VStack(alignment: .center, spacing: 8) {
                            Text(brand.name)
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                                .onTapGesture{
                                    showBottomView.toggle()
                                }
                            Text(brand.link)
                                .font(.system(size: 12))
                                .foregroundColor(.blue)
                                .onTapGesture{
                                    showLinkView.toggle()
                                }
                        }
                        .frame(width: 90)
                        .padding(.vertical, 12)
                        
                        if brand.id != brands.last?.id {
                            Rectangle()
                                .frame(width: 1)
                                .foregroundColor(.gray.opacity(0.3))
                                .frame(height: 40)
                        }
                    }
                }
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.05)))
            .padding(.horizontal, 10)
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.5))
                
                Text("*")
                    .foregroundColor(.gray.opacity(0.5))
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.5))
            }
            .padding(.horizontal)
        }
    
        .sheet(isPresented: $showBottomView){
            BottomView()
                .presentationDetents([.fraction(0.3)])
        }
        .sheet(isPresented: $showLinkView){
            LinkView()
                .presentationDetents([.fraction(0.55)])
        } //  .background(Color.gray.opacity(0.25))
        .background(colorScheme == .dark ? Color.white : Color.white)
    }
}



struct InfluencerProfileView_Previews: PreviewProvider {
    static var previews: some View {
        InfluencerProfileView()
    }
}

