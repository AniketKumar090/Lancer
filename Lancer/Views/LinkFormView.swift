import SwiftUI

struct LinkFormView: View {
    @Binding var customURL: String
    @Binding var customLabel: String
    @Binding var customPrice: String
    @Binding var links: [LinkItem]
    @Environment(\.dismiss) private var dismiss
    @State private var isPriceEnabled = true
    var isViewingDetails: Bool = false
    @Environment(\.colorScheme) var colorScheme
    @State private var showErrorMessage = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Custom URL")
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.top,20)
            
            Text("URL from a different social media")
                .font(.subheadline)
                .foregroundStyle(.white)
            
            TextField("",text: $customURL,prompt: Text("Custom Link").foregroundColor(.white))
                .textFieldStyle(CustomTextFieldStyle())
                .foregroundColor(Color.white)
                .disabled(isViewingDetails)
                .cornerRadius(12)
                .background(RoundedRectangle(cornerRadius: 12).stroke(Color(.gray), lineWidth: 1))
            
            TextField("",text: $customLabel,prompt: Text("Label").foregroundColor(.white))
                .textFieldStyle(CustomTextFieldStyle())
                .foregroundColor(Color.white)
                .disabled(isViewingDetails)
                .cornerRadius(12)
                .background(RoundedRectangle(cornerRadius: 12).stroke(Color(.gray), lineWidth: 1))
                
            HStack {
                Text("Add price")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                
                Spacer()
                
                ZStack {
                    Circle()
                        .stroke(lineWidth: 2)
                        .frame(width: 30,height: 30)
                        .foregroundColor(Color(red: 1, green: 0.384, blue: 0.09))
                    Button(action: {
                        isPriceEnabled.toggle()
                    }, label:{
                        Circle()
                            .frame(width: 25,height: 25)
                            .foregroundColor(Color(red: 1, green: 0.384, blue: 0.09))
                            .opacity(isPriceEnabled ? 1 : 0)
                    }).disabled(isViewingDetails)
                }
            }
            
            TextField("",text: $customPrice,prompt: Text("₹300000").foregroundColor(.white))
                    .textFieldStyle(CustomTextFieldStyle())
                    .foregroundColor(Color.white)
                    .disabled(isViewingDetails)
                    .strikethrough(isPriceEnabled ? false : true)
                    .disabled(isPriceEnabled ? false : true)
                    .cornerRadius(12)
                    .background(RoundedRectangle(cornerRadius: 12).stroke(Color(.gray), lineWidth: 2))
                    
           
            if showErrorMessage {
                Text("All fields are required.")
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .padding(.top, 10)
            }
            
            if !isViewingDetails {
                Button(action: saveLink) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isFormValid() ? Color(red: 1, green: 0.384, blue: 0.09) : Color(red: 1, green: 0.384, blue: 0.09))
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 10)
                .disabled(!isFormValid())
            }
        }
        .padding()
        .background(colorScheme == .dark ? Color(.gray).opacity(0.05) : Color(.black).opacity(0.85))
    }
    
   
    private func isFormValid() -> Bool {
        return !customURL.isEmpty && !customLabel.isEmpty && (isPriceEnabled ? !customPrice.isEmpty : true)
    }
    
    
    private func saveLink() {
        if isFormValid() {
            let newLink = LinkItem(
                name: customLabel,
                url: customURL,
                icon: "app.fill",
                price: isPriceEnabled && !customPrice.isEmpty ? "Rs \(customPrice)" : nil
            )
            links.append(newLink)
            
            CouponStore.saveCoupons(links)
            
            customURL = ""
            customLabel = ""
            customPrice = ""
            isPriceEnabled = false
            
            dismiss()
        } else {
            showErrorMessage = true
        }
    }
}

