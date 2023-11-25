//
//  WeatherApiService.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import Foundation

protocol ApiService {
    func fetchForecast(for latitude: Double, and longitude: Double, withCompletion completion: @escaping (ForecastResponse?) -> Void)
}

class WeatherApiService: ApiService, ObservableObject {
    let baseURL = "https://api.openweathermap.org/data/3.0/onecall"
    let decoder = JSONDecoder()
    
    func fetchForecast(for latitude: Double, and longitude: Double, withCompletion completion: @escaping (ForecastResponse?) -> Void) {
        let forecastUrl = "\(baseURL)?lat=\(latitude)&lon=\(longitude)&appid=\(Secrets.apiKey)&units=metric"
        
        guard let url = URL(string: forecastUrl) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) {[weak self]  data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            do {
                let response = try self?.decoder.decode(ForecastResponse.self, from: data)
                completion(response)
            } catch {
                completion(nil)
            }
            
        }.resume()
    }
}
