//
//  SegmentedListRowView.swift
//  Pizza
//
//  Created by Marvin John on 21.12.24.
//

import SwiftUI

struct SegmentedListRowView: View {
    @ObservedObject var vm: PizzaViewModel
    @EnvironmentObject var ordersVm: OrdersViewModel

    var body: some View {
        ScrollView(showsIndicators: false) {
            let filteredPizzas = vm.pizzas.filter { pizza in
                vm.selectedFilter == .all || pizza.category == vm.selectedFilter
            }

            if filteredPizzas.isEmpty {
                Text("No pizzas available for this filter")
                    .foregroundColor(.gray)
                    .italic()
            } else {
                ForEach(filteredPizzas) { pizza in
                    RowView(pizza: pizza)
                }
            }
        }
        .padding(.top)
    }
}



#Preview {
    SegmentedListRowView(vm: PizzaViewModel())
}
