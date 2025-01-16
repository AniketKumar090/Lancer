import SwiftUI

struct BottomView: View {
    @State private var buttonIsPressed: Bool = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading,spacing: 6) {
           
                
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .padding(.leading, 20)
                            .foregroundColor(.gray)
                    })
                    
                    Image(systemName: "circle.fill")
                        .foregroundColor(.blue)
                    
                    Text("Dreams")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                    Spacer()
                }
                
                HStack {
                    Text("www.workhard.com")
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                        .padding(.leading, 20)
                    Spacer()
                }
                
                Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.bottom)
                    .padding(.horizontal, 20)
            }
            .background(colorScheme == .dark ? Color.black : Color.black)
            HStack {
                Text("Tab and copy apple do")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                Spacer()
                Button(action: {
                    buttonIsPressed.toggle()
                }, label: {
                    Text("djfnjdksn")
                        .font(.system(size: 14))
                        .foregroundColor(.blue)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 2)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.clear).stroke(.blue))
                })
            }
            .padding([.horizontal,.top])
            .background(colorScheme == .dark ? Color.white : Color.white)
        }
        .sheet(isPresented: $buttonIsPressed) {
            LinkView()
                .background(.gray.opacity(0.25))
                .presentationDetents([.fraction(0.55)])
        }
    }
}


#Preview {
    BottomView()
}
