//
//  Pizza.swift
//  Pizza
//
//  Created by Marvin John on 20.12.24.
//

import Foundation

class Pizza: Identifiable {
    let id = UUID()
    let name: String
    var price: Double
    var amount: Double
    let imageName: String
    let description: String
    var category: Segmented

    init(name: String, price: Double, amount: Double, imageName: String, description: String, category: Segmented) {
        self.name = name
        self.price = price
        self.amount = amount
        self.imageName = imageName
        self.description = description
        self.category = category
    }
}
