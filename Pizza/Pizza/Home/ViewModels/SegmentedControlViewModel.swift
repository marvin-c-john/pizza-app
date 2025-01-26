//
//  SegmentedControlViewModel.swift
//  Pizza
//
//  Created by Marvin John on 21.12.24.
//

import Foundation

enum Segmented: Int, CaseIterable{
    case all
    case classic
    case special
    case vegan
    
    var title: String{
        switch self{
        case .all: return "All"
        case .classic: return "Classic"
        case .special: return "Special"
        case .vegan: return "Vegan"
        }
    }
}
