//
//  LocationForecastViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import SettingsDomain
import WeatherDomain

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

extension LocationForecastViewState {
    init(forecast: Forecast, settings: Settings) {
        self.init(
            header: LocationForecastHeaderViewState(from: forecast.location, condition: forecast.currentCondition),
            multiDayForecast: LocationForecastSectionViewState(from: forecast, settings: settings),
            temperatureSetting: OptionMenuViewState(
                options: [
                    OptionMenuViewState.Option(from: TemperatureSetting.celsius),
                    OptionMenuViewState.Option(from: TemperatureSetting.fahrenheit)
                ],
                selected: OptionMenuViewState.Option(from: settings.temperature))
        )
    }
}
