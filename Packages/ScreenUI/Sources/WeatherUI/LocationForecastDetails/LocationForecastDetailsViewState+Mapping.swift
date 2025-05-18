//
//  LocationForecastDetailsViewState+Mapping.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SettingsDomain
import WeatherDomain

extension LocationForecastDetailsViewState {
    init(location: ForecastLocation, forecastDay: ForecastDay, settings: Settings) {
        self.init(
            title: forecastDay.dayOfWeekFormatted(timeZone: location.timeZone),
            header: LocationForecastHeaderViewState(from: location, condition: forecastDay.condition),
            range: LocationForecastRangeViewState(from: forecastDay, settings: settings),
            stats: LocationForecastStatsViewState(from: forecastDay)
        )
    }
}
