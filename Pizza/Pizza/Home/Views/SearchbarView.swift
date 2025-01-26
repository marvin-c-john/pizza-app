//
//  SearchbarView.swift
//  Pizza
//
//  Created by Marvin John on 20.12.24.
//

import SwiftUI

struct SearchbarView: View {
    @State var text = ""
    var body: some View {
        VStack{
            TextField("Search...", text: $text)
                .frame(height: 50)
                .padding(.horizontal, 35)
                .background(.new2)
                .cornerRadius(20)
                .padding(.horizontal)
                .overlay(alignment: .leading) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 30)
                            .font(.caption)
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                        HStack {
                            Text("|")
                                .foregroundStyle(.gray)
                            Image(systemName: "mic")
                        }
                        .padding(.trailing, 40)
                        .onTapGesture {
                            //perform
                        }
                      
                    }
                    
                   
                }
                

        }
    }
}

#Preview {
    SearchbarView()
}
