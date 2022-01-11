//
//  MainView.swift
//  WeatherApps
//
//  Created by Rostadhi Akbar, M.Pd on 07/01/22.
//

import SwiftUI

struct MainView: View {
    var weather: ModelData
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                VStack(alignment: .center, spacing: 20) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Hari Ini, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(alignment: .center, spacing: 20) {
                            Image(systemName: "cloud.fill")
                                .font(.system(size: 40))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                        
                    }
                    
                    
                    HStack {
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                    }
                    .frame(alignment: .center)
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Cuaca Hari Ini")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        RowView(logo: "thermometer", name: "Suhu Min ", value: (weather.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        RowView(logo: "thermometer", name: "Suhu Max", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    
                    HStack {
                        RowView(logo: "wind", name: "Angin", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        RowView(logo: "humidity", name: "Kelembapan", value: "\(weather.main.humidity.roundDouble())%")
                    }
                    HStack {
                        RowView(logo: "digitalcrown.horizontal.press", name: "Tekanan", value: (weather.main.pressure.roundDouble() + " m/s"))
                        Spacer()
                        RowView(logo: "exclamationmark.circle", name: "Created by", value: "adhi")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 30)
                .foregroundColor(Color(red: 0.0, green: 0.613, blue: 0.815))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.781, saturation: 0.902, brightness: 0.911, opacity: 0.795))
        .preferredColorScheme(.dark)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(weather: previewWeather)
    }
}
