//
//  RowView.swift
//  WeatherApps
//
//  Created by Rostadhi Akbar, M.Pd on 08/01/22.
//

import SwiftUI

struct RowView: View {
    var logo: String
    var name: String
    var value: String
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color("AccentColor"))
                .cornerRadius(50)

            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(logo: "thermometer", name: "Feels like", value: "16°")
    }
}
