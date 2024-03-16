//
//  Income.swift
//  CecilsCoffeeShop
//
//  Created by Ashton Cecil on 3/15/24.
//

import Foundation

struct Income: Identifiable{
    
    var id: String = UUID().uuidString
    var sourceName: String
    var amount: Double
    var description: String
    
}
