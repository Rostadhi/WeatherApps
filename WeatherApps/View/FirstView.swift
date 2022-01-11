//
//  FirstView.swift
//  WeatherApps
//
//  Created by Rostadhi Akbar, M.Pd on 07/01/22.
//

import SwiftUI
import CoreLocationUI

struct FirstView: View {
    @EnvironmentObject var location: Location
    
    var body: some View {
        VStack {
            VStack(spacing: 25) {
                Text("Weather App")
                    .bold().font(.title)
                Text("Masukkan Lokasi Anda")
                    .padding()
            }
            .padding()
            
            LocationButton(.currentLocation) {
                location.requestLocation()
            }
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity,  maxHeight: .infinity)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
            .preferredColorScheme(.light)
    }
}
