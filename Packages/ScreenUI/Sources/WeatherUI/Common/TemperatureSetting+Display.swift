//
//  TemperatureSetting+Display.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/16/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import SettingsDomain

extension TemperatureSetting {
    var displayTitle: String {
        switch self {
        case .celsius:      "Celsius"
        case .fahrenheit:   "Fahrenheit"
        }
    }
}
