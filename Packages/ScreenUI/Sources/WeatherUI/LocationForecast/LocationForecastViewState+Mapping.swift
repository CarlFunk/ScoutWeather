//
//  LocationForecastViewState+Mapping.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SettingsDomain
import WeatherDomain

extension LocationForecastViewState {
    init(forecast: Forecast, settings: Settings, isLoading: Bool) {
        self.init(
            isLoading: isLoading,
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
