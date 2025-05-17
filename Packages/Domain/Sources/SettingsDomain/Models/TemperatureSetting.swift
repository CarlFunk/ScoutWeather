//
//  TemperatureSetting.swift
//  SettingsDomain
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

public enum TemperatureSetting: CaseIterable, Identifiable {
    private enum IDValue: String {
        case celsius
        case fahrenheit
    }
    
    case celsius
    case fahrenheit
    
    public init?(id: String) {
        switch id {
        case IDValue.celsius.rawValue:      self = .celsius
        case IDValue.fahrenheit.rawValue:   self = .fahrenheit
        default:                            return nil
        }
    }
    
    public var unit: UnitTemperature {
        switch self {
        case .celsius:      UnitTemperature.celsius
        case .fahrenheit:   UnitTemperature.fahrenheit
        }
    }
    
    public var id: String {
        switch self {
        case .celsius:      IDValue.celsius.rawValue
        case .fahrenheit:   IDValue.fahrenheit.rawValue
        }
    }
}
