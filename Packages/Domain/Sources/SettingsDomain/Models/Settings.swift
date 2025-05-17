//
//  Settings.swift
//  SettingsDomain
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

public struct Settings: Mockable {
    public let temperature: TemperatureSetting
    
    public init(temperature: TemperatureSetting) {
        self.temperature = temperature
    }
    
    public func updated(temperature: TemperatureSetting) -> Settings {
        Settings(temperature: temperature)
    }
    
    public static func mock(values: MockValues<Settings>) -> Settings {
        Settings(
            temperature: values.get(\.temperature, defaultValue: .fahrenheit)
        )
    }
}
