
import SwiftUI

struct ExpenseDetailView: View {
    var expenseSource: Expenses
    @ObservedObject var finances: Finances
    @State private var details: String = ""

    var body: some View {
        VStack {
            TextField("Enter details here", text: $details)
                .multilineTextAlignment(.center) // Center align the text field content
                .padding()
                .frame(maxWidth: .infinity) // Use maximum width for the text field

            Button("Save") {
                if let index = finances.expenseSources.firstIndex(where: { $0.id == expenseSource.id }) {
                    finances.expenseSources[index].description = details
                }
            }
            .padding()
        }
        .padding() // Add padding around the VStack to avoid being too close to the edges
        .navigationTitle(expenseSource.sourceName)
        .onAppear {
            details = expenseSource.description
        }
    }
}
