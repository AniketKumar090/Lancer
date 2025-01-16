import SwiftUI

struct LinksTabView: View {
    @Binding var links: [LinkItem]
    @State private var showCustomLinkForm = false
    @State private var customURL = ""
    @State private var customLabel = ""
    @State private var customPrice = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .padding(.leading, 20)
                            .foregroundColor(.white)
                    })
                    Text("Links")
                        .font(.system(size: 24))
                        .padding(.leading, 4)
                        .foregroundColor(.white)
                    Spacer()
                }
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(links) { link in
                            LinkRowCoupons(
                                link: link,
                                customURL: $customURL,
                                customLabel: $customLabel,
                                customPrice: $customPrice
                            )
                        }
                    }
                    .padding()
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        customURL = ""
                        customLabel = ""
                        customPrice = ""
                        showCustomLinkForm.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.white)
                            .frame(width: 56, height: 56)
                            .background(Color(red: 1, green: 0.384, blue: 0.09))
                            .clipShape(Circle())
                            .shadow(radius: 4, y: 2)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
            }
        }
        .sheet(isPresented: $showCustomLinkForm) {
            LinkFormView(
                customURL: $customURL,
                customLabel: $customLabel,
                customPrice: $customPrice,
                links: $links
            )
            .presentationDetents([.medium])
        }
    }
}
