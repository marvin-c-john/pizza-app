//
//  ContentView.swift
//  Pizza
//
//  Created by Marvin John on 19.12.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var ordersVm: OrdersViewModel
    var body: some View {
        NavigationView{
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                OrdersView()
                    .tabItem {
                        Label("My Order", systemImage: "bag")
                    }
                    .navigationTitle("Orders")
                
                HomeView()
                    .tabItem {
                        Label("Saved", systemImage: "heart")
                    }
                
                HomeView()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
            }
            .tint(.green)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(OrdersViewModel())
}
