//
//  ContentView.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import SwiftUI

struct CitiesListView: View {
    @ObservedObject var viewModel: CityListViewModel
    @EnvironmentObject var api: WeatherApiService
    
    var body: some View {
        NavigationStack{
            ScrollView {
                if (viewModel.hasCity) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.citiesFiltered) { city in
                            NavigationLink(value: city) {
                                CityForecastCellView(city: city)
                            }.padding(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
                        }
                    }
                } else {
                    NoCityFoundView()
                }
            }.navigationDestination(for: City.self) { city in
                CityForecastView(viewModel: CityForecastViewModel(city: city, apiService: api))
            }.navigationTitle("Cities").searchable(text: $viewModel.searchTerm)
                .navigationViewStyle(.columns)
        }
    }
}

#Preview {
    CitiesListView(viewModel: CityListViewModel())
}
