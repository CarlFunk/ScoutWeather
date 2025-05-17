//
//  ForecastRequest+Mapping.swift
//  WeatherData
//
//  Created by Carl Funk on 5/13/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import WeatherDomain

extension ForecastRequest {
    var networkRequest: ForecastNetworkRequest {
        ForecastNetworkRequest(
            location: location.id,
            days: days)
    }
}
