
import SwiftUI

struct IncomeView: View {
    @ObservedObject var finances: Finances

    var body: some View {
        List {
            // Section for the total income
            Section {
                HStack {
                    Text("Total Income")
                        .font(.headline)
                    Spacer()
                    Text("$\(finances.totalIncome, specifier: "%.2f")")
                        .font(.headline)
                }
            }
            
            // List of income sources with navigation to detail view
            ForEach(finances.incomeSources) { income in
                NavigationLink(destination: IncomeDetailView(incomeSource: income, finances: finances)) {
                    VStack(alignment: .leading) {
                        Text(income.sourceName).font(.headline)
                        Text("$\(income.amount, specifier: "%.2f")").font(.subheadline)
                    }
                }
            }
            .onDelete(perform: deleteIncome)
            
            // Navigation link to add a new income source
            NavigationLink(destination: AddIncomeView(finances: finances)) {
                Text("Add New Income Source")
            }
        }
        .navigationTitle("Income Sources")
    }

    func deleteIncome(at offsets: IndexSet) {
        finances.incomeSources.remove(atOffsets: offsets)
    }
}
