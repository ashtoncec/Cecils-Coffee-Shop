
import SwiftUI

struct AddExpenseView: View {
    @ObservedObject var finances: Finances
    @State private var sourceName = ""
    @State private var amount = ""
    @State private var details = ""

    var body: some View {
        Form {
            TextField("Source Name", text: $sourceName)
            TextField("Amount", text: $amount)
                .keyboardType(.decimalPad)
            TextField("Details (Optional)", text: $details)
            
            Button("Add") {
                if let amountDouble = Double(amount) {
                    let newExpense = Expenses(id: UUID().uuidString, sourceName: sourceName, amount: amountDouble, description: details)
                    finances.addExpenseSource(newExpense)
                    // Optionally reset fields here if not using modal presentation
                    sourceName = ""
                    amount = ""
                    details = ""
                }
            }
        }
        .navigationTitle("Add Expense Source")
    }
}
