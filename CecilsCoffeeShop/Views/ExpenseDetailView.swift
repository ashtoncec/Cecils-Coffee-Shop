
import SwiftUI

struct ExpenseDetailView: View {
    var expenseSource: Expenses
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
                .border(Color.red, width: 1)
                .cornerRadius(5)

            Button("Save") {
                if let index = finances.expenseSources.firstIndex(where: { $0.id == expenseSource.id }) {
                    finances.expenseSources[index].description = details
                }
            }
            .padding()
        }
        .padding()
        .navigationTitle(expenseSource.sourceName)
        .onAppear {
            details = expenseSource.description
        }
    }
}
