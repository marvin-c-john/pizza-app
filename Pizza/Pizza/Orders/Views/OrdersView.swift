//
//  OrdersView.swift
//  Pizza
//
//  Created by Marvin John on 20.12.24.
//

import SwiftUI

struct OrdersView: View {
    @EnvironmentObject var ordersVm: OrdersViewModel
    @EnvironmentObject var pizzaVM: PizzaViewModel
    var body: some View {
        ZStack {
            Color.new.ignoresSafeArea()
            VStack{
                HStack {
                    Text("Orders")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .padding(.leading)
                ScrollView{
                    ForEach(ordersVm.orders) { order in
                            OrdersRowView(count: $pizzaVM.count, pizza: order)
                    
                      
                    }
                   
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                   Button(role: .destructive) {
                       
                   } label: {
                       Label("Delete", systemImage: "trash")
                   }
               }
                
            }
           
        }
    }
}

#Preview {
    OrdersView()
        .environmentObject(OrdersViewModel())
}
