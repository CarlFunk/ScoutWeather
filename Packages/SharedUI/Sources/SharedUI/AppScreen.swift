//
//  AppScreen.swift
//  SharedUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleNavigation
import Foundation
import WeatherDomain

public enum AppScreen: NavigationScreen {
    case userForecast
    case forecastDetails(location: ForecastLocation, forecastDay: ForecastDay)
    
    public var id: String {
        switch self {
        case .userForecast:     "user_forecast"
        case .forecastDetails:  "forecast_details"
        }
    }
}
