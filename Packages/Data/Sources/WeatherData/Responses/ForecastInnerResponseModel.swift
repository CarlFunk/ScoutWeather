//
//  ForecastInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

public struct ForecastInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case forecastDays = "forecastday"
    }
    
    public let forecastDays: [ForecastDayInnerResponseModel]
}
