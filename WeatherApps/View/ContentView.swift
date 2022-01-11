//
//  ContentView.swift
//  WeatherApps
//
//  Created by Rostadhi Akbar, M.Pd on 06/01/22.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct ContentView: View {
    @StateObject var location = Location()
    var weatherApi = WeatherAPI()
    @State var weather: ModelData?
    
    var body: some View {
        VStack {
            if let coordinate = location.locate {
                if let weather = weather {
                    MainView(weather: weather)
                } else {
                    LoadView()
                        .task {
                            do {
                                weather = try await weatherApi.getActualWeather(latitude: coordinate.latitude, longitude: coordinate.longitude)
                            } catch {
                                print("Gagal Me-Load Cuaca: \(error)")
                            }
                        }
                }
            } else {
                if location.isLoading {
                    LoadView()
                } else {
                    FirstView()
                        .environmentObject(location)
                }
            }
        }
        .background(Color(hue: 0.842, saturation: 0.492, brightness: 0.744))
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
