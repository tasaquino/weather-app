//
//  CityListViewModel.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import Foundation

class CityListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var citiesList: [City] = MockData.cities
    
    var citiesFiltered: [City] {
        if (searchTerm.isEmpty) {
            return citiesList
        }
        return citiesList.filter { $0.name.lowercased().contains(searchTerm.lowercased()) }
    }
    
    var hasCity: Bool {
        return !citiesFiltered.isEmpty
    }
}
