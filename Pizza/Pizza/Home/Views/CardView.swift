//
//  CardView.swift
//  Pizza
//
//  Created by Marvin John on 19.12.24.
//

import SwiftUI

struct CardView: View {
    let pizza: Pizza
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray.opacity(0.2),lineWidth: 2)
                .frame(width: 190, height: 250)
                .shadow(radius: 10)
                .overlay {
                    VStack {
                        HStack{
                            HStack {
                                Spacer()
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                
                                Text("4.5")
                            }
                            .font(.caption)
                            .padding(.trailing)
                        }
                        .padding(.top, 10)
                        
                        Image(pizza.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(pizza.name)
                                    .font(.headline)
                                HStack{
                                    Image(systemName: "clock")
                                    Text("15 min | 500kal")
                                    
                                }
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            }
                            .padding(3)
                            
                            Spacer()
                        }
                        .padding(.leading, 13)
                        
                        HStack{
                            Text("\(pizza.price, specifier: "%.2f") €")
                                .font(.headline)
                            
                            Spacer()
                            
                            Circle()
                                .fill(.black)
                                .frame(width: 20, height: 20)
                                .overlay {
                                    Image(systemName: "plus")
                                        .font(.caption)
                                        
                                }
                                .foregroundStyle(.white)
                                
                        }
                        .padding()
                        
                    } 
                }
        }
//        .shadow(radius: 3)
    }
}

#Preview {
    CardView(pizza: Pizza(name: "Pepperoni", price: 30.00, amount: 0, imageName: "Image", description: "Our tomato based pizza topped with beef pepperoni, and cheesy mozzarella on our Italian rich tasty dough. A delicious classic.", category: .classic))
}
