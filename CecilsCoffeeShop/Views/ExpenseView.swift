

import SwiftUI

struct ExpenseView: View {
    @ObservedObject var finances: Finances

    var body: some View {
        List {
            // Section for the total expenses
            Section {
                HStack {
                    Text("Total Expenses")
                        .font(.headline)
                    Spacer()
                    Text("$\(finances.totalExpenses, specifier: "%.2f")")
                        .font(.headline)
                }
            }
            
            // List of expense sources with navigation to detail view
            ForEach(finances.expenseSources) { expense in
                NavigationLink(destination: ExpenseDetailView(expenseSource: expense, finances: finances)) {
                    VStack(alignment: .leading) {
                        Text(expense.sourceName).font(.headline)
                        Text("$\(expense.amount, specifier: "%.2f")").font(.subheadline)
                    }
                }
            }
            
            .onDelete(perform: deleteExpense)
            
            // Navigation link to add a new expense source
            NavigationLink(destination: AddExpenseView(finances: finances)) {
                Text("Add New Expense Source")
            }
        }
        .navigationTitle("Expense Sources")
    }

    func deleteExpense(at offsets: IndexSet) {
        finances.expenseSources.remove(atOffsets: offsets)
    }
}
