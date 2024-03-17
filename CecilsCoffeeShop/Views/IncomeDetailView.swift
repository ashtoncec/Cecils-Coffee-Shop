
import SwiftUI

struct IncomeDetailView: View {
    var incomeSource: Income
    @ObservedObject var finances: Finances
    @State private var details: String = ""

    var body: some View {
        VStack {
            TextField("Enter details here", text: $details)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity)

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
