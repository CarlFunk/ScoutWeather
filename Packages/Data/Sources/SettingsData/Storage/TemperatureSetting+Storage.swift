//
//  TemperatureSetting+Storage.swift
//  SettingsData
//
//  Created by Carl Funk on 5/16/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import SettingsDomain

extension TemperatureSetting {
    private enum StorageValue: String {
        case celsius = "C"
        case fahrenheit = "F"
    }
    
    var storageValue: String {
        switch self {
        case .celsius:      StorageValue.celsius.rawValue
        case .fahrenheit:   StorageValue.fahrenheit.rawValue
        }
    }
    
    init?(from storageValue: String) {
        switch storageValue {
        case StorageValue.celsius.rawValue:     self = .celsius
        case StorageValue.fahrenheit.rawValue:  self = .fahrenheit
        default:                                return nil
        }
    }
}
