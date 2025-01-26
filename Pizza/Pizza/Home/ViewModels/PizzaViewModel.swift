//
//  PizzaViewModel.swift
//  Pizza
//
//  Created by Marvin John on 20.12.24.
//

import Foundation

class PizzaViewModel: ObservableObject{
    @Published var count: Double = 1
    @Published var selectedFilter: Segmented = .all
    @Published var pizzas: [Pizza] = [
        Pizza(name: "Pepperoni",
              price: 30.55,
              amount: 0,
              imageName: "Image",
              description: "Our tomato based pizza topped with beef pepperoni, and cheesy mozzarella on our Italian rich tasty dough. A delicious classic.", category: .classic),
        Pizza(name: "Margherita",
              price: 20.99,
              amount: 0,
              imageName: "pizza2",
              description: "This margherita pizza recipe is a celebration of simple, fresh ingredients! Juicy tomatoes, basil, and mozzarella cheese top a crisp, chewy crust.", category: .classic),
        Pizza(name: "Funghi",
              price: 25.20,
              amount: 0,
              imageName: "funghi",
              description: "Assorted mushrooms with sage and brown butter makes a warm and delicious Funghi pizza – full of fresh and local flavours! Not to mention our cheesy Fresh Mozzarella Slices to tie it all together.", category: .classic),
        Pizza(name: "Vegan",
              price: 20.55,
              amount: 0,
              imageName: "vegan",
              description: "Artisan pizza crust is made of flour, yeast, water, and salt - all vegan. Sauces - tomato (perhaps including onions and carrots), pesto (basil, garlic, olive oil), all vegan. Toppings - go with vegetables. The only possible issue is the cheese. There is way too much cheese on most pizzas anyway", category: .vegan),
        Pizza(name: "BBQ Chicken",
              price: 35,
              amount: 0,
              imageName: "BBQ chicken",
              description: "This BBQ chicken pizza has spicy barbecue sauce, diced chicken, peppers, onion, and cilantro, all covered with cheese and baked to bubbly goodness! This is similar to a recipe I had at a popular pizza place in California. ", category: .special),
        Pizza(name: "Seafood",
              price: 45.50,
              amount: 0,
              imageName: "seafood 1",
              description: "This is a French Pêcheur (fisherman) inspired seafood pizza. Homemade pizza dough, coated with tangy homemade mayonnaise. Topped with fresh mussels, shrimp, and a medley of fresh seafood. Covered with mozzarella and creamy brie. Drizzled with a lemon and garlic butter sauce. Baked in our woodfired oven, Bon appétit! R. ", category: .special),
        Pizza(name: "Hot dog",
              price: 35.95,
              amount: 0,
              imageName: "hot dog",
              description: "Whether you call it a frankfurter, hot dog, wiener or bologna, it's a cooked sausage and a year-round favorite. They can be made from beef, pork, turkey, chicken or a combination — the label must state which. And there are federal standards of identity for their content.", category: .special),
        
    ]
}
