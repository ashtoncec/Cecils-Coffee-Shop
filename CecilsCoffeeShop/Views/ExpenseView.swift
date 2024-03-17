//
//  ExpenseView.swift
//  CecilsCoffeeShop
//
//  Created by Ashton Cecil on 3/16/24.
//

import SwiftUI

struct ExpenseView: View {
    
    @ObservedObject var finances: Finances

     var body: some View {
         List(finances.expenseSources) { expense in
             VStack(alignment: .leading) {
                 Text(expense.sourceName).font(.headline)
                 Text("$\(expense.amount, specifier: "%.2f")").font(.subheadline)
             }
         }
         .navigationTitle("Expense Sources")
     }
 }
