
import Foundation

class Finances: Identifiable, ObservableObject {
    
    var id: String = UUID().uuidString
    var title: String
    
    @Published var incomeSources: [Income] = []
    @Published var expenseSources: [Expenses] = []
    
    init(title: String) {
        self.title = title
        
        // Initial income sources
        self.incomeSources = [
            Income(id: UUID().uuidString, sourceName: "Coffee Sales", amount: 100000, description: "At Cecil's Coffee Shop, we sell a wide variety of drinks, including espressos, cold brews, mochas, lattes and much more !"),
            Income(id: UUID().uuidString, sourceName: "Bakery Treats", amount: 15000, description: "We sell many delicious options, including muffins, croissants, pastries and sandwiches"),
            Income(id: UUID().uuidString, sourceName: "Mugs", amount: 10000, description: "We sell beautiful mugs designed by the owner that can appeal to the eye of any customer!"),
            Income(id: UUID().uuidString, sourceName: "Coffee Beans", amount: 6000, description: "Many customers in our area enjoy brewing their own coffee, and that is no problem because they can buy high-quality coffee beans directly from us"),
            Income(id: UUID().uuidString, sourceName: "Events", amount: 4000, description: "At Cecil's Coffee Shop, we have a large event room with a vibrant environment that is perfect for hosting coffee tasting events, business meetings or even birthday parties!")
        ]
        
       // Initial expense sources
        self.expenseSources = [
            
            Expenses(id: UUID().uuidString, sourceName: "Labor", amount: 50000, description: "This is money we owe our valuable employees."),
            Expenses(id: UUID().uuidString, sourceName: "Mortgage", amount: 25000, description: "This is money we set aside for paying back the loan amount"),
            Expenses(id: UUID().uuidString, sourceName: "Supplies", amount: 12000, description: "Electricity, water and utility bills"),
            Expenses(id: UUID().uuidString, sourceName: "Equipment", amount: 4000, description: "The is money we set aside in case any emergency repairs are needed whether it's a coffee machines, cash registers, or any other vital equipment..."),
            Expenses(id: UUID().uuidString, sourceName: "Marketing", amount: 2000, description: "Used for oppurtunities to promote our coffee shop and show off our brand name!")
        ]
    }
    
    func addIncomeSource(_ incomeSource: Income) {
        self.incomeSources.append(incomeSource)
    }
    
    func addExpenseSource(_ expenseSource: Expenses) {
        self.expenseSources.append(expenseSource)
    }
    
    func updateIncomeSource(id: String, newDetails: String) {
        if let index = self.incomeSources.firstIndex(where: { $0.id == id }) {
            self.incomeSources[index].description = newDetails
        }
    }
    
    func updateExpenseSource(id: String, newDetails: String) {
        if let index = self.expenseSources.firstIndex(where: { $0.id == id }) {
            self.expenseSources[index].description = newDetails
        }
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
    
    var profitOrLossPercentage: Double {
        guard totalIncome != 0 else { return 0 }
        return (netIncome / totalIncome) * 100
    }
}
        

    

