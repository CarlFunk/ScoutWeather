//
//  AppDependency.swift
//  ScoutWeather
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleDependency
import Foundation
import LocationData
import LocationDomain
import NetworkCore
import NetworkService
import SettingsData
import SettingsDomain
import WeatherData
import WeatherDomain

final class AppDependency {
    static func setup() {
        DependencyContainer.shared.register(type: LocationRepository.self) {
            LiveLocationRepository()
        }
        
        DependencyContainer.shared.register(type: NetworkAuthDelegate.self) {
            AppNetworkAuthDelegate()
        }
        
        DependencyContainer.shared.register(type: NetworkServicing.self, name: "Weather") {
            let authDelegate = try! DependencyContainer.shared.resolve(type: NetworkAuthDelegate.self, lifetime: .singleton)
            
            return WeatherNetworkService(authDelegate: authDelegate)
        }
        
        DependencyContainer.shared.register(type: SettingsRepository.self) {
            LiveSettingsRepository()
        }
        
        DependencyContainer.shared.register(type: WeatherRepository.self) {
            LiveWeatherRepository()
        }
    }
}
