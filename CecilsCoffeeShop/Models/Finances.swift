
import Foundation

class Finances: Identifiable, ObservableObject {
    
    var id: String = UUID().uuidString
    var title: String
    
    @Published var incomeSources: [Income]
    @Published var expenseSources: [Expenses]
    
    init(title: String) {
        
        self.title = title
        
        // Initial income data shown to user
        self.incomeSources = [
            Income(id: UUID().uuidString, sourceName: "Coffee Sales", amount: 1500.00, description: "Income from selling coffee"),
            Income(id: UUID().uuidString, sourceName: "Coffee Mugs", amount: 500.00, description: "Income from branded coffee mugs")
        ]
        
       // Initial expense data shown to user
        self.expenseSources = [
            Expenses(id: UUID().uuidString, sourceName: "Utilities", amount: 300.00, description: "Monthly utilities bill"),
            Expenses(id: UUID().uuidString, sourceName: "Rent", amount: 1200.00, description: "Monthly rent payment")
        ]
    }
    
    func addIncomeSource(_ incomeSource: Income) {
        incomeSources.append(incomeSource)
    }
    
    func addExpenseSource(_ expenseSource: Expenses) {
        expenseSources.append(expenseSource)
    }
    
    var totalIncome: Double {
        incomeSources.reduce(0) { $0 + $1.amount }
    }
    
    var totalExpenses: Double {
        expenseSources.reduce(0) { $0 + $1.amount }
    }
    
    var netIncome: Double {
        totalIncome - totalExpenses
        
        
    }
}
