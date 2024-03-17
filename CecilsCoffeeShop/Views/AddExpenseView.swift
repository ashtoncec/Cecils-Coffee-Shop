
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
            TextField("Details", text: $details)
            
            Button("Add Expense Source") {
                if let amountDouble = Double(amount) {
                    let newExpense = Expenses(id: UUID().uuidString, sourceName: sourceName, amount: amountDouble, description: details)
                    finances.addExpenseSource(newExpense)
                    
                    // Again, this will clear fields after adding details
                    sourceName = ""
                    amount = ""
                    details = ""
                }
            }
            .disabled(sourceName.isEmpty || amount.isEmpty)
        }
        .navigationTitle("Add New Expense")
    }
}
