//
//  LocationManager.swift
//  Pizza
//
//  Created by Marvin John on 20.12.24.
//

import Foundation
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var address: String?
    
    override init(){
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation(){
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first{
            location = firstLocation.coordinate
            getAddress(from: firstLocation)
        }
    }
    
    func getAddress(from location: CLLocation){
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
                    if let error = error {
                        print("Error while reverse geocoding: \(error)")
                        self.address = "Unable to find address"
                    } else if let placemark = placemarks?.first {
                        self.address = [
                            placemark.name,
                            placemark.locality,
                            placemark.administrativeArea,
                            placemark.country
                        ]
                        .compactMap { $0 }
                        .joined(separator: ", ")
                    }
                }
            }

            func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
                print("Failed to get location: \(error)")
            }
    

    }
    

