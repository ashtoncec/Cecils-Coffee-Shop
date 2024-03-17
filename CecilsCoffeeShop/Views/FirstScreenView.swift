
import SwiftUI

struct FirstScreenView: View {
    var finances: Finances
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Cecil's Coffee Shop")
                    .bold()
                    .font(.system(size: 28))
                    .kerning(2)
                    .frame(maxWidth: .infinity)
                    .background(Color.brown, ignoresSafeAreaEdges: .horizontal)
                    .padding()
                
                Text("Owned and operated by Ashton Cecil")
                    .font(.system(size: 19))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue, ignoresSafeAreaEdges: .horizontal)
                
                
                
                NavigationLink(destination: UtilitiesView(finances: finances)) {
                    Image("CoffeeShop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 470)
                        .padding()
                }
            }
        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleFinances = Finances(title: "Test")
        FirstScreenView(finances: sampleFinances)
    }
} // This will help with rendering a live preview of FirstScreenView
