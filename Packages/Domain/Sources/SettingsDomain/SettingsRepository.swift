//
//  SettingsRepository.swift
//  SettingsDomain
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine
import Foundation

public protocol SettingsRepository {
    func subscribeSettings() -> AnyPublisher<Settings, Never>
    
    func updateTemperature(_ setting: TemperatureSetting) throws
}
