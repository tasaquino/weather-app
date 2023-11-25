//
//  CityForecastView.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import SwiftUI

struct CityForecastView: View {
    @ObservedObject var viewModel: CityForecastViewModel
    var body: some View {
        Text("Hello \(viewModel.city.name)")
        Text("Temp: \(viewModel.forecast?.current.temp.toCelsius() ?? "-")")
    }
}

#Preview {
    CityForecastView(viewModel: CityForecastViewModel(city: MockData.cities[0], apiService: WeatherApiService()))
}
