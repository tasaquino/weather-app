//
//  City.swift
//  WeatherApp
//
//  Created by Thais Aquino on 25/11/2023.
//

import Foundation

struct City: Identifiable, Hashable {
    let id: String
    let name: String
    let longitude: Double
    let latitude: Double
}
