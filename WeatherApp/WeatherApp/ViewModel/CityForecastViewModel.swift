//
//  CityForecastViewModel.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import Foundation

class CityForecastViewModel: ObservableObject {
    @Published var city: City
    @Published var forecast: ForecastResponse?
    var apiService: ApiService
    
    init(city: City, apiService: ApiService) {
        self.city = city
        self.apiService = apiService
        self.fetchCityForecast()
    }
    
    func fetchCityForecast() {
        apiService.fetchForecast(for: city.latitude, and: city.longitude) { [weak self] forecastData in
            
            DispatchQueue.main.async {
                self?.forecast = forecastData
            }
        }
    }
}
