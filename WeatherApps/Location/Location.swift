//
//  Location.swift
//  WeatherApps
//
//  Created by Rostadhi Akbar, M.Pd on 07/01/22.
//

import Foundation
import CoreLocation
import CoreLocationUI
class Location: NSObject, ObservableObject, CLLocationManagerDelegate {
    let handler = CLLocationManager()
    
    @Published var locate: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        handler.delegate = self
    }
    
    func requestLocation() {
        isLoading = true
        handler.requestLocation()
    }
    
    func locationManager(_ handler: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locate = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Gagal Mendapatkan Lokasi", error)
        isLoading = false
    }
}
