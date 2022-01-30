//
//  Weather.swift
//  Weather
//
//  Created by Игорь Павличенков on 27.01.2022.
//

import Foundation

typealias WeatherModels = [WeatherModel]

struct WeatherModel: Codable {
    
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case main
        case wind
        case name
    }
    
}

struct Weather: Codable {
    
    let main: String
    let description: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case main
        case description
        case icon
    }
    
}

struct Main: Codable {
    
    let temperature: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
}

struct Wind: Codable {
    
    let speed: Double
    
    enum CodingKeys: String, CodingKey {
        case speed
    }
    
}

