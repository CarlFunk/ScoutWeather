//
//  ScoutWeatherApp.swift
//  ScoutWeather
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleNavigation
import SharedUI
import SwiftUI

@main
struct ScoutWeatherApp: App {
    
    init() {
        if AppLaunchArgument.isEnabled(.useMockServices) {
            MockDependency.setup()
        } else {
            AppDependency.setup()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ManagedNavigationCoordinatorView { coordinator in
                AppScreenView(
                    navigation: Navigation(screen: .userForecast),
                    coordinator: coordinator)
            } screenView: { navigation, coordinator in
                AppScreenView(
                    navigation: navigation,
                    coordinator: coordinator)
            }
        }
    }
}
