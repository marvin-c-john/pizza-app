//
//  OrdersRowView.swift
//  Pizza
//
//  Created by Marvin John on 21.12.24.
//

import SwiftUI

struct OrdersRowView: View {
    @EnvironmentObject var ordersVm: OrdersViewModel
    @EnvironmentObject var pizzaVm: PizzaViewModel
    @State var updatedPrice = 0.0
    @State var isUpdating = false
    @Binding var count: Double
    let pizza: Pizza
   
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray.opacity(0.2), lineWidth: 2)
                .frame(height: 130)
                .padding()
                .overlay {
                    HStack {
                        Image(pizza.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.4, height: 120)  // Dynamische Breite
                            .cornerRadius(20)
                            .padding(.trailing, 10)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            HStack(spacing: 30) {
                                Text(pizza.name)
                                    .fontWeight(.semibold)
                                    .lineLimit(1)
                                    .font(.caption)
                                    .frame(width: 90,height: 30, alignment: .leading)
                                
                               
                                
                                Capsule()
                                    .stroke(.yellow ,lineWidth: 1)
                                    .overlay {
                                        HStack(spacing: 4) {
                                            Spacer()
                                            Image(systemName: "star.fill")
                                                .foregroundStyle(.yellow)
                                            
                                            Text("4.5")
                                        }
                                        .font(.caption)
                                        .frame(width: 50)
                                        .padding(.trailing)
                                        
                                    }
                                    .frame(width: 45,height: 20)
                                    .background {
                                        Color.yellow.opacity(0.3)
                                          
                                    }
                                    .clipShape(Capsule())
                                    .scaleEffect(0.8)
                                   
                                   
                                    
                               
                            }
                            
                            HStack {
                                Image(systemName: "clock")
                                    .font(.caption2)
                                Text("15 min | 500 Kal")
                                    .foregroundStyle(.gray)
                                    .font(.caption2)
                                    .lineLimit(1)
                            }

                            HStack {
                                Image(systemName: "house")
                                    .font(.caption2)
                                Text("54 Summit Street")
                                    .foregroundStyle(.gray)
                                    .font(.caption2)
                                    .lineLimit(1)
                            }

                            HStack(spacing: 30) {
                                Text("\(updatedPrice, specifier: "%.2f")€")
                                    .font(.caption2)
                                   
                                    .frame(width: 75, height: 30, alignment: .leading)
                                    
                                   
                                Capsule()
                                    .stroke(lineWidth: 1)
                                    .frame(width: 55, height: 25)
                                    .overlay {
                                        HStack {
                                            Button("-") {
                                              count -= 1
                                            }
                                            .foregroundStyle(.gray)
                                            
                                            Text("\(count, specifier: "%.f")")
                                            
                                            Button("+") {
                                                count += 1
                                            }
                                            .foregroundStyle(.gray)
                                        }
                                    }
                                    .font(.caption2)
                                    .onChange(of: count) { oldValue, newValue in
                                        if oldValue != count{
                                            updatedPrice = pizza.price * count
                                        }
                                    }
                                    .onAppear {
                                        updatedPrice = pizza.price * pizza.amount
                                    }
                            }
//                            .frame(maxWidth: 160)
                        }
                        
                        .frame(maxWidth: geometry.size.width * 0.65) // Dynamische Breite
                    }
                    .padding(.horizontal, 20)
                   
                }
               
        }
        .frame(height: 130)  // Höhe des gesamten Containers
        .shadow(radius: 3)
        .background(Color.new)
       
         
    }
//    func updatePrice(price: Double) -> Double{
//        if
//    }
}


#Preview {
    @State var count: Double = 2.0
    OrdersRowView(count: $count, pizza: Pizza(name: "Pepperoni", price: 30.55, amount: 2, imageName: "Image", description: "Our tomato based pizza topped with beef pepperoni, and cheesy mozzarella on our Italian rich tasty dough. A delicious classic.", category: .classic))
        .environmentObject(OrdersViewModel())
        .environmentObject(PizzaViewModel())
}

