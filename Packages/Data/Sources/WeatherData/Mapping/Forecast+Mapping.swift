//
//  Forecast+Mapping.swift
//  WeatherData
//
//  Created by Carl Funk on 5/13/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import WeatherDomain

extension Forecast {
    init(from networkModel: ForecastNetworkResponse, request: ForecastRequest) {
        self.init(
            currentCondition: ForecastCondition(from: networkModel.current.condition),
            location: ForecastLocation(from: networkModel.location, request: request),
            days: ForecastDay.parse(from: networkModel.forecast.forecastDays)
        )
    }
}
