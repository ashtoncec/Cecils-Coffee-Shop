//
//  Finances.swift
//  CecilsCoffeeShop
//
//  Created by Ashton Cecil on 3/16/24.
//

import Foundation

class Finances: Identifiable, ObservableObject {
    
    var id: String = UUID().uuidString
    var title: String
    
    @Published var incomeSources: [Income]
    @Published var expenseSources: [Expenses]
    
    init(title: String, incomeSources: [Income] = [], expenseSources: [Expenses] = []) {
        self.title = title
        self.incomeSources = incomeSources
        self.expenseSources = expenseSources
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
