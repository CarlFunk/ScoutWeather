//
//  Settings+Mapping.swift
//  SettingsData
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import SettingsDomain

extension Settings {
    init(from storageModel: StorageSettings?) {
        self.init(
            temperature: TemperatureSetting(from: storageModel?.temperature ?? "") ?? .fahrenheit
        )
    }
    
    var storageModel: StorageSettings {
        StorageSettings(temperature: temperature.storageValue)
    }
}
