//
//  FirstScreenView.swift
//  CecilsCoffeeShop
//
//  Created by Ashton Cecil on 3/16/24.
//

import SwiftUI

struct FirstScreenView: View {
    var finances: Finances
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Cecil's Coffee Shop")
                    .bold()
                    .font(.system(size: 28))
                    .kerning(2)
                    .padding()
                
                Text("Owned and operated by Ashton Cecil")
                    .padding()
                
                NavigationLink(destination: UtilitiesView(finances: finances)) {
                    Image("CoffeeShop")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 470)
                        .padding()
                }
            }
        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample Finances object for preview purposes
        let sampleFinances = Finances(title: "Sample Coffee Shop")
        FirstScreenView(finances: sampleFinances)
    }
}
