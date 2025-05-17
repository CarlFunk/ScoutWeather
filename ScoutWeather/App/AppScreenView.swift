//
//  AppScreenView.swift
//  ScoutWeather
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleNavigation
import SharedUI
import SwiftUI
import WeatherUI

struct AppScreenView: View {
    let navigation: Navigation<AppScreen>
    let coordinator: NavigationCoordinator<AppScreen>
    
    var body: some View {
        switch navigation.screen {
        case .userForecast:
            UserLocationForecastScreen(viewModel: UserLocationForecastViewModel(coordinator: coordinator))
        case .forecast(let location):
            LocationForecastView(viewModel: LocationForecastViewModel(location: location, coordinator: coordinator))
        case .forecastDetails(let location, let forecastDay):
            LocationForecastDetailsView(viewModel: LocationForecastDetailsViewModel(location: location, forecastDay: forecastDay, coordinator: coordinator))
        }
    }
}
