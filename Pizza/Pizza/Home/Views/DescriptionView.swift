//
//  DescriptionView.swift
//  Pizza
//
//  Created by Marvin John on 21.12.24.
//

import SwiftUI

struct DescriptionView: View {
    @ObservedObject var pizzaVm: PizzaViewModel
    @EnvironmentObject var ordersVm: OrdersViewModel
    var pizza: Pizza
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.green)
                .blur(radius: 800)
                .ignoresSafeArea()
            
            Circle()
                .fill(.new)
                .frame(width: 800, height: 800)
                .offset(x: 100, y: 260)
            
            VStack(spacing: 20) {
                Spacer()
                
                Image(pizza.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .padding(.bottom, 50)
                
                // Pizza name
                HStack {
                    Text(pizza.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    // Decrement Button
                    HStack(spacing: 20){
                        Button {
                            if pizzaVm.count == 0 {
                                pizzaVm.count = 0
                            } else {
                                pizzaVm.count -= 1
                            }
                           
                        } label: {
                            Circle()
                                .stroke(lineWidth: 1)
                                .tint(.gray.opacity(0.6))
                                .frame(width: 30, height: 30)
                                .overlay {
                                    Image(systemName: "minus")
                                        .fontWeight(.semibold)
                                        .tint(.black)
                                }
                        }
                        //Amount of pizzas
                        Text("\(pizzaVm.count, specifier: "%.f") ")
                        
                        // Increment Button
                        Button {
                            pizzaVm.count += 1
                        } label: {
                            Circle()
                                .stroke(lineWidth: 1)
                                .tint(.gray.opacity(0.6))
                                .frame(width: 30, height: 30)
                                .overlay {
                                    Image(systemName: "plus")
                                        .fontWeight(.semibold)
                                        .tint(.white)
                                }
                                .background(Color.black)
                                .clipShape(Circle())
                               
                        }

                    }
                }
                .padding(.horizontal)
                
                
                Text(pizza.description)
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Divider()
                
                HStack{
                    VStack{
                        Text("Total amount")
                            .font(.caption2)
                        Text("\(pizza.price * pizzaVm.count, specifier: "%.2f") €")
                            .fontWeight(.semibold)

                    }
                    
                    Spacer()
                    
                    Button {
                        ordersVm.orders.append(pizza)
                        pizza.amount = pizzaVm.count
                        print(pizza.amount)
                        
                    } label: {
                        Capsule()
                        
                            .stroke(lineWidth: 1)
                            .tint(.gray.opacity(0.6))
                            .frame(width: 140, height: 40)
                            .background(.green)
                            .clipShape(Capsule())
                            .overlay {
                                Text("Add to Cart")
                                    .foregroundStyle(.white)
                                  
                            }
                           
                    }
                }
                .padding()
                .padding(.bottom, 80)

            }
            .frame(maxWidth: UIScreen.main.bounds.width)
//            .onDisappear {
//                pizzaVm.count = 1
//            }
            
        }
    }

}

#Preview {
    DescriptionView( pizzaVm: PizzaViewModel(), pizza: Pizza(name: "Pepperoni",
                                  price: 30.55, amount: 2,
                                                              imageName: "Image",
                                                              description: "Our tomato based pizza topped with beef pepperoni, and cheesy mozzarella on our Italian rich tasty dough. A delicious classic.", category: .classic))
    .environmentObject(OrdersViewModel())
}
