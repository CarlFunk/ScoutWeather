//
//  LocationForecastDetailsViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SettingsDomain
import WeatherDomain

struct LocationForecastDetailsViewState {
    let title: String
    let header: LocationForecastHeaderViewState
    let range: LocationForecastRangeViewState
    let stats: LocationForecastStatsViewState
    
    init(
        title: String,
        header: LocationForecastHeaderViewState,
        range: LocationForecastRangeViewState,
        stats: LocationForecastStatsViewState
    ) {
        self.title = title
        self.header = header
        self.range = range
        self.stats = stats
    }
}

extension LocationForecastDetailsViewState {
    init(location: ForecastLocation, forecastDay: ForecastDay, settings: Settings) {
        self.init(
            title: forecastDay.dayOfWeekFormatted(),
            header: LocationForecastHeaderViewState(from: location, condition: forecastDay.condition),
            range: LocationForecastRangeViewState(from: forecastDay, settings: settings),
            stats: LocationForecastStatsViewState(from: forecastDay)
        )
    }
}
