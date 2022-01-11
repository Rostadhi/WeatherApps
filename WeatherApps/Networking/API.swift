//
//  API.swift
//  WeatherApps
//
//  Created by Rostadhi Akbar, M.Pd on 07/01/22.
//

import Foundation
import CoreLocation
import Combine

class WeatherAPI {
    
    
    func getActualWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws ->
    ModelData {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=fcb565a79efc4be5d0eba6586ff7eced&units=metric")
        else {
            fatalError("URL Kosong")
        }
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error Fetch Data")
        }
        
        let decodedData = try JSONDecoder().decode(ModelData.self, from: data)
        
        return decodedData
    }
}
