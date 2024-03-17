
import SwiftUI

struct ContentView: View {
    @StateObject var finances = Finances(title: "Cecil's Coffee Shop")
    var body: some View {
        
        FirstScreenView(finances: finances)
        
    }
}

#Preview {
    ContentView()
}

