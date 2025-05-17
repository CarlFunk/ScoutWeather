//
//  DayWeatherInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 5/13/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

public struct DayWeatherInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case averageHumidityPercentage = "avghumidity"
        case averageTemperatureCelcius = "avgtemp_c"
        case averageTemperatureFahrenheit = "avgtemp_f"
        case chanceOfRainPercentage = "daily_chance_of_rain"
        case chanceOfSnowPercentage = "daily_chance_of_snow"
        case condition
        case maxTemperatureCelcius = "maxtemp_c"
        case maxTemperatureFahrenheit = "maxtemp_f"
        case minTemperatureCelcius = "mintemp_c"
        case minTemperatureFahrenheit = "mintemp_f"
    }
    
    /// Average humidity as percentage
    public let averageHumidityPercentage: Int
    
    /// Average temperature in celsius for the day
    public let averageTemperatureCelcius: Double
    
    /// Average temperature in fahrenheit for the day
    public let averageTemperatureFahrenheit: Double
    
    /// Chance of rain as percentage
    public let chanceOfRainPercentage: Int
    
    /// Chance of snow as percentage
    public let chanceOfSnowPercentage: Int
    
    public let condition: ConditionInnerResponseModel
    
    /// Maximum temperature in celsius for the day
    public let maxTemperatureCelcius: Double
    
    /// Maximum temperature in fahrenheit for the day
    public let maxTemperatureFahrenheit: Double
    
    /// Minimum temperature in celsius for the day
    public let minTemperatureCelcius: Double
    
    /// Minimum temperature in fahrenheit for the day
    public let minTemperatureFahrenheit: Double
    
}
