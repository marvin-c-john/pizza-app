//
//  TopSectionView.swift
//  Pizza
//
//  Created by Marvin John on 19.12.24.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct TopSectionView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        HStack{
            Image(systemName: "mappin.and.ellipse.circle")
            
            if let address = locationManager.address{
                Text("\(address)")
                    .font(.caption)
            } else {
                LocationButton{
                    locationManager.requestLocation()
                }
                .foregroundStyle(.white)
                .frame(height: 24)
                .font(.caption)
                .cornerRadius(10)
                .padding()
                .tint(.green)
                
                
            }
           
           
            
            Spacer()
            
            HStack{
                Image(systemName: "heart")
                Image(systemName: "bell")
            }
           
        }
        .padding()
    }
}

#Preview {
    TopSectionView()
}
