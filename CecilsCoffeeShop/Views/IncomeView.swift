
import SwiftUI

struct IncomeView: View {
    @ObservedObject var finances: Finances

    var body: some View {
        List {
            ForEach(finances.incomeSources) { income in
                NavigationLink(destination: IncomeDetailView(incomeSource: income, finances: finances)) {
                    VStack(alignment: .leading) {
                        Text(income.sourceName).font(.headline)
                        Text("$\(income.amount, specifier: "%.2f")").font(.subheadline)
                    }
                }
            }
            .onDelete(perform: deleteIncome)
            
            // Navigate to AddIncomeView to add a new income source
            NavigationLink(destination: AddIncomeView(finances: finances)) {
                Text("Add New Income Source")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Income Sources")
    }

    func deleteIncome(at offsets: IndexSet) {
        finances.incomeSources.remove(atOffsets: offsets)
    }
}
