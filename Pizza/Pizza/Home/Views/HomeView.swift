//
//  HomeView.swift
//  Pizza
//
//  Created by Marvin John on 19.12.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var pizzaVm: PizzaViewModel
    @EnvironmentObject var ordersVm: OrdersViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color.new.ignoresSafeArea()
                
                
              
                VStack {
                    TopSectionView()
                    
                    Spacer()
                    
                    ScrollView {
                        VStack {
                            SearchbarView()
                            TrustedSectionView()
                            RecommendedSectionView(vm: pizzaVm)
                            
                        }
                        
                    }
                }
               
                
                
            }
        }
    }
}


#Preview {
    HomeView()
        .environmentObject(OrdersViewModel())
}
