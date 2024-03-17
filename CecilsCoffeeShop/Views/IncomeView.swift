//
//  IncomeView.swift
//  CecilsCoffeeShop
//
//  Created by Ashton Cecil on 3/16/24.
//

import SwiftUI

struct IncomeView: View {
    
    @ObservedObject var finances: Finances

     var body: some View {
         List(finances.incomeSources) { income in
             VStack(alignment: .leading) {
                 Text(income.sourceName).font(.headline)
                 Text("$\(income.amount, specifier: "%.2f")").font(.subheadline)
             }
         }
         .navigationTitle("Income Sources")
     }
 }

