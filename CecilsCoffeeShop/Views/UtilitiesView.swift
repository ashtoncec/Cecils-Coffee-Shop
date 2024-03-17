
import SwiftUI

struct UtilitiesView: View {
    
    @ObservedObject var finances: Finances

      var body: some View {
          VStack {
              Text("Net Income: \(finances.netIncome, specifier: "%.2f")")
                  .foregroundColor(finances.netIncome > 0 ? .green : (finances.netIncome < 0 ? .red : .blue))
                  .font(.title)
                  .padding()

              NavigationLink("View Income Sources", destination: IncomeView(finances: finances))
              NavigationLink("View Expense Sources", destination: ExpenseView(finances: finances))
          }
          .navigationTitle("Financial Overview")
      }
  }
