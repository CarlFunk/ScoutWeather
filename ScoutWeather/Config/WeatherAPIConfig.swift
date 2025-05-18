//
//  WeatherAPIConfig.swift
//  ScoutWeather
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

struct WeatherAPIConfig: Codable {
    enum CodingKeys: String, CodingKey {
        case apiKey = "API_KEY"
    }
    
    let apiKey: String
}
