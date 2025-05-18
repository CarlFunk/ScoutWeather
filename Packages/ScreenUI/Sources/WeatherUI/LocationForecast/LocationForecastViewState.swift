//
//  LocationForecastViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SharedUI
import Foundation

struct LocationForecastViewState {
    let isLoading: Bool
    let header: LocationForecastHeaderViewState
    let multiDayForecast: LocationForecastSectionViewState
    let temperatureSetting: OptionMenuViewState
    let alertViewState: AlertViewState?
    
    init(
        isLoading: Bool,
        header: LocationForecastHeaderViewState,
        multiDayForecast: LocationForecastSectionViewState,
        temperatureSetting: OptionMenuViewState,
        alertViewState: AlertViewState? = nil
    ) {
        self.isLoading = isLoading
        self.header = header
        self.multiDayForecast = multiDayForecast
        self.temperatureSetting = temperatureSetting
        self.alertViewState = alertViewState
    }
    
    func updated(alertViewState: AlertViewState?) -> LocationForecastViewState {
        LocationForecastViewState(
            isLoading: isLoading,
            header: header,
            multiDayForecast: multiDayForecast,
            temperatureSetting: temperatureSetting,
            alertViewState: alertViewState
        )
    }
}
