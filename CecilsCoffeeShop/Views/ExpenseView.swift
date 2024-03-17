

import SwiftUI

struct ExpenseView: View {
    @ObservedObject var finances: Finances

    var body: some View {
        List {
            ForEach(finances.expenseSources) { expense in
                VStack(alignment: .leading) {
                    Text(expense.sourceName).font(.headline)
                    Text("$\(expense.amount, specifier: "%.2f")").font(.subheadline)
                }
            }
            .onDelete(perform: deleteExpense)
            
            // Navigation to AddExpenseView
            NavigationLink(destination: AddExpenseView(finances: finances)) {
                Text("Add New Expense Source")
            }
        }
        .navigationBarTitle("Expense Sources")
    }

    private func deleteExpense(at offsets: IndexSet) {
        finances.expenseSources.remove(atOffsets: offsets)
    }
}
