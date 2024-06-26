
import SwiftUI

struct AddIncomeView: View {
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
            
            Button("Add Income Source") {
                if let amountDouble = Double(amount) {
                    let newIncome = Income(id: UUID().uuidString, sourceName: sourceName, amount: amountDouble, description: details)
                    finances.addIncomeSource(newIncome)
                    
                    // This is meant to clear fields after adding details
                    sourceName = ""
                    amount = ""
                    details = ""
                }
            }
            .disabled(sourceName.isEmpty || amount.isEmpty)
        }
        .navigationTitle("Add New Income")
    }
}
