//
//  ForecastDayInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

public struct ForecastDayInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day
    }
    
    /// Forecast date
    public let date: String
    
    /// Forecast date as unix time
    public let dateEpoch: Int
    
    public let day: DayWeatherInnerResponseModel
}
