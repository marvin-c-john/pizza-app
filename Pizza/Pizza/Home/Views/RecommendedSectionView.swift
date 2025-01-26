//
//  RecommendedSectionView.swift
//  Pizza
//
//  Created by Marvin John on 19.12.24.
//

import SwiftUI
struct RecommendedSectionView: View {
    @ObservedObject var vm: PizzaViewModel
    @EnvironmentObject var ordersVm: OrdersViewModel
    // Computed Property zum Filtern der Pizzen basierend auf dem aktuellen Filter
    private var filteredPizzas: [Pizza] {
        switch vm.selectedFilter {
        case .all:
            return vm.pizzas
        case .classic:
            return vm.pizzas.filter { $0.category == .classic }
        case .special:
            return vm.pizzas.filter { $0.category == .special }
        case .vegan:
            return vm.pizzas.filter { $0.category == .vegan }
        }
    }

    var body: some View {
       
            VStack(alignment: .leading) {
                Text("Recommended")
                    .font(.headline)
                    .padding(.leading)
                
                SegmentedControlView(vm: vm)
                    .padding()
                
                ScrollView {
                    // Anzeigen der gefilterten Pizzen
                    ForEach(filteredPizzas) { pizza in
                        NavigationLink {
                            DescriptionView( pizzaVm: vm, pizza: pizza)
                        } label: {
                            RowView(pizza: pizza)
                                .padding(.bottom)
                        }
                        .tint(.black)
                        
                    }
                }
            }
        }
    }



#Preview {
    RecommendedSectionView(vm: PizzaViewModel())
}
