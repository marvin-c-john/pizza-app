//
//  TrustedSectionView.swift
//  Pizza
//
//  Created by Marvin John on 19.12.24.
//

import SwiftUI

struct TrustedSectionView: View {
    @StateObject var pizzaVm = PizzaViewModel()
    var body: some View {
 
            VStack {
                HStack{
                    Text("Your trusted picks")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("View all")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(pizzaVm.pizzas) { pizza in
                            CardView(pizza: pizza)
                       
                                .scaleEffect(0.9)
                        }
                    }
                }
            }
    }
}

#Preview {
    TrustedSectionView()
}
