//
//  SegmentedControlView.swift
//  Pizza
//
//  Created by Marvin John on 21.12.24.
//

import SwiftUI

struct SegmentedControlView: View {
    @ObservedObject var vm: PizzaViewModel

    var body: some View {
        HStack(spacing: 15) {
            ForEach(Segmented.allCases, id: \.rawValue) { item in
                segmentButton(for: item)
            }
        }
    }

    private func segmentButton(for item: Segmented) -> some View {
        VStack {
            Capsule()
                .stroke(
                    vm.selectedFilter == item ? Color.green : Color.gray.opacity(0.2),
                    lineWidth: 1
                )
                .frame(width: 80, height: 35)
                .background(
                    Capsule()
                        .fill(vm.selectedFilter == item ? Color.green : Color.clear) // Color.new entfernt
                )
                .overlay(
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(vm.selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(vm.selectedFilter == item ? .white : .black)
                )
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                vm.selectedFilter = item
            }
        }
    }
}

#Preview {
    SegmentedControlView(vm: PizzaViewModel())
}
