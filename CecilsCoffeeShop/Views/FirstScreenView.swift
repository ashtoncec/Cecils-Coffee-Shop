//
//  FirstScreenView.swift
//  CecilsCoffeeShop
//
//  Created by Ashton Cecil on 3/16/24.
//

import SwiftUI

struct FirstScreenView: View {
    var body: some View {
        NavigationView{
            
                NavigationLink(destination: UtilitiesView()){
                    Image("CoffeeShop")
                }
            }
        }
    }


#Preview {
    FirstScreenView()
}
