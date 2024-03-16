//
//  ContentView.swift
//  CecilsCoffeeShop
//
//  Created by Ashton Cecil on 3/15/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack{
            
            FirstScreenTitle()
            
        }
    }
}


struct FirstScreenTitle: View{
    var body: some View{
        VStack {
            
            Text("Cecil's Coffee Shop")
                .bold()
                .font(.system(size: 28))
                .kerning(2)
            
            Text("Owned and operated by Ashton Cecil")
        }
        .padding()
        
    }
    
}



#Preview {
    ContentView()
}

