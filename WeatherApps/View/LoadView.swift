//
//  LoadView.swift
//  WeatherApps
//
//  Created by Rostadhi Akbar, M.Pd on 07/01/22.
//

import SwiftUI

struct LoadView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}
