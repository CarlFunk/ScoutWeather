//
//  LocationForecastSectionViewState+Mapping.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SettingsDomain
import WeatherDomain

extension LocationForecastSectionViewState {
    init(from domainModel: Forecast, settings: Settings) {
        self.init(
            rows: domainModel.days.map { forecastDay in
                LocationForecastRowViewState(location: domainModel.location, forecastDay: forecastDay, settings: settings)
            }
        )
    }
}
