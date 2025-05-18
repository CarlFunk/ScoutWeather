//
//  LocationForecastHeaderViewState+Mapping.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import WeatherDomain

extension LocationForecastHeaderViewState {
    init(from location: ForecastLocation, condition: ForecastCondition) {
        self.init(
            name: location.name,
            region: location.region,
            condition: condition.text,
            conditionIcon: condition.icon
        )
    }
}
