//
//  ForecastDay+Mapping.swift
//  WeatherData
//
//  Created by Carl Funk on 5/13/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import CommonDomain
import Foundation
import WeatherDomain

extension ForecastDay {
    static func parse(from networkModels: [ForecastDayInnerResponseModel]) -> [ForecastDay] {
        networkModels.map { ForecastDay(from: $0) }
    }
    
    init(from networkModel: ForecastDayInnerResponseModel) {
        self.init(
            date: Date(timeIntervalSince1970: Double(networkModel.dateEpoch)),
            maxTemperature: Measurement(
                value: networkModel.day.maxTemperatureFahrenheit,
                unit: .fahrenheit),
            minTemperature: Measurement(
                value: networkModel.day.minTemperatureFahrenheit,
                unit: .fahrenheit),
            avgTemperature: Measurement(
                value: networkModel.day.averageTemperatureFahrenheit,
                unit: .fahrenheit),
            avgHumidity: networkModel.day.averageHumidityPercentage,
            rainPossibility: networkModel.day.chanceOfRainPercentage,
            snowPossibility: networkModel.day.chanceOfSnowPercentage,
            condition: ForecastCondition(from: networkModel.day.condition)
        )
    }
}
