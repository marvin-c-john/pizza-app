//
//  PizzaApp.swift
//  Pizza
//
//  Created by Marvin John on 19.12.24.
//

import SwiftUI

@main
struct PizzaApp: App {
    @StateObject  var pizzaVm = PizzaViewModel()
    @StateObject var ordersVm = OrdersViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ordersVm)
                .environmentObject(pizzaVm)
        }
    }
}
