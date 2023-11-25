//
//  CityForecastView.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import SwiftUI

struct CityForecastCellView: View {
    var city: City
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(city.name).font(.title).foregroundStyle(.black).padding(EdgeInsets(top: 25, leading: 0, bottom: 25, trailing: 0))
                Spacer()
            }.background(.indigo).opacity(0.6)
                .cornerRadius(16).shadow(radius: 5)
        }
    }
}

#Preview {
    CityForecastCellView(city:MockData.cities[0])
}
