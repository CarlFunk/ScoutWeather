//
//  LocationForecastRowViewState+Mapping.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SettingsDomain
import WeatherDomain

extension LocationForecastRowViewState {
    init(location: ForecastLocation, forecastDay: ForecastDay, settings: Settings) {
        self.init(
            id: forecastDay.id,
            date: forecastDay.dayOfWeekFormatted(),
            range: LocationForecastRangeViewState(from: forecastDay, settings: settings),
            conditionIcon: forecastDay.condition.icon,
            conditionText: forecastDay.condition.text)
    }
}
