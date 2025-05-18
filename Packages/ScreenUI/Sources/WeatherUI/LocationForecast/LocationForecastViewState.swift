//
//  LocationForecastViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

struct LocationForecastViewState {
    let header: LocationForecastHeaderViewState
    let multiDayForecast: LocationForecastSectionViewState
    let temperatureSetting: OptionMenuViewState
    
    init(
        header: LocationForecastHeaderViewState,
        multiDayForecast: LocationForecastSectionViewState,
        temperatureSetting: OptionMenuViewState
    ) {
        self.header = header
        self.multiDayForecast = multiDayForecast
        self.temperatureSetting = temperatureSetting
    }
}
