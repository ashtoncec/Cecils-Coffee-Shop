
import SwiftUI

struct IncomeDetailView: View {
    var incomeSource: Income
    @ObservedObject var finances: Finances
    @State private var details: String = ""

    var body: some View {
        VStack {
            TextField("Enter details here", text: $details)
                .padding()

            Button("Save") {
                // Directly update the income source in the finances object
                if let index = finances.incomeSources.firstIndex(where: { $0.id == incomeSource.id }) {
                    finances.incomeSources[index].description = details
                }
            }
            .padding()
        }
        .navigationTitle(incomeSource.sourceName)
        .onAppear {
            // Initialize details text with the current description of the income source
            details = incomeSource.description
        }
    }
}
