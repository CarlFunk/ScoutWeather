//
//  UserLocationForecastViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleNavigation
import SharedUI
import WeatherDomain

enum UserLocationForecastViewState {
    case defaultLocationForecast(LocationQuery, NavigationCoordinator<AppScreen>)
    case error
    case loading
    case locationForecast(LocationQuery, NavigationCoordinator<AppScreen>)
}
