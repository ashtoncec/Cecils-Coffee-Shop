
import SwiftUI

struct IncomeDetailView: View {
    var incomeSource: Income
    @ObservedObject var finances: Finances
    @State private var details: String = ""

    var body: some View {
        VStack {
            Text("Description:")
                .font(.headline)
                .padding(.top)

            TextEditor(text: $details)
                .multilineTextAlignment(.center)
                .padding()
                .frame(minHeight: 100)
                .border(Color.blue, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/) 
                .cornerRadius(5)

            Button("Save") {
                if let index = finances.incomeSources.firstIndex(where: { $0.id == incomeSource.id }) {
                    finances.incomeSources[index].description = details
                }
            }
            .padding()
        }
        .padding()
        .navigationTitle(incomeSource.sourceName)
        .onAppear {
            details = incomeSource.description
        }
    }
}
