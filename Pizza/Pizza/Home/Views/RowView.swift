//
//  RowView.swift
//  Pizza
//
//  Created by Marvin John on 20.12.24.
//

import SwiftUI

struct RowView: View {
    @EnvironmentObject var ordersVm: OrdersViewModel
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

                            HStack(spacing: 70) {
                                Text("\(pizza.price, specifier: "%.2f") €")
                                    .font(.caption2)
                                    .lineLimit(1)
                                Capsule()
                                    .frame(width: 55, height: 25)
                                    .overlay {
                                        HStack {
                                            Image(systemName: "plus")
                                                .foregroundStyle(.white)
                                            
                                            Button {
                                                
                                            } label: {
                                                Text("Add")
                                                    .foregroundStyle(.white)
                                            }

                                        }
                                        .font(.caption2)
                                    }
                                    .font(.caption2)
                            }
                        }
                        
                        .frame(maxWidth: geometry.size.width * 0.65) // Dynamische Breite
                    }
                    .padding(.horizontal, 20)
                }
        }
        .frame(height: 130)  // Höhe des gesamten Containers
        .shadow(radius: 2)
    }
}


#Preview {
    RowView(pizza: Pizza(name: "Pepperoni", price: 15, amount: 0, imageName: "Image", description: "", category: .special))
        .environmentObject(OrdersViewModel())
}
