

import SwiftUI

struct ExpenseView: View {
    @ObservedObject var finances: Finances

    var body: some View {
        List {
            ForEach(finances.expenseSources) { expense in
                NavigationLink(destination: ExpenseDetailView(expenseSource: expense, finances: finances)) {
                    VStack(alignment: .leading) {
                        Text(expense.sourceName).font(.headline)
                        Text("$\(expense.amount, specifier: "%.2f")").font(.subheadline)
                    }
                }
            }
            .onDelete(perform: deleteExpense)

            NavigationLink(destination: AddExpenseView(finances: finances)) {
                Text("Add New Expense Source")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Expense Sources")
    }

    func deleteExpense(at offsets: IndexSet) {
        finances.expenseSources.remove(atOffsets: offsets)
    }
}
