//
//  MockDependency.swift
//  SharedUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleDependency
import LocationDomain
import SettingsDomain
import WeatherDomain

final public class MockDependency {
    public static func setup() {
        DependencyContainer.shared.register(type: LocationRepository.self) {
            MockLocationRepository()
        }
        
        DependencyContainer.shared.register(type: SettingsRepository.self) {
            MockSettingsRepository()
        }
        
        DependencyContainer.shared.register(type: WeatherRepository.self) {
            MockWeatherRepository()
        }
    }
}
