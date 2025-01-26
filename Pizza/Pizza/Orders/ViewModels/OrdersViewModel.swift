//
//  OrdersViewModel.swift
//  Pizza
//
//  Created by Marvin John on 21.12.24.
//

import Foundation

class OrdersViewModel: ObservableObject {
    @Published var orders: [Pizza] = []
    @Published var totalAmount: Double = 0


}
