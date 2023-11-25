//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            CitiesListView(viewModel: CityListViewModel()).environmentObject(WeatherApiService())
        }
    }
}
