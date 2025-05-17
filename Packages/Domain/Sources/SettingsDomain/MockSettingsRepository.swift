//
//  MockSettingsRepository.swift
//  SettingsDomain
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Combine
import Foundation

public final class MockSettingsRepository: SettingsRepository {
    let settingsPublisher: CurrentValueSubject<Settings, Never>
    
    public init(settings: Settings = Settings.mock()) {
        self.settingsPublisher = CurrentValueSubject<Settings, Never>(settings)
    }
    
    public func subscribeSettings() -> AnyPublisher<Settings, Never> {
        settingsPublisher
            .eraseToAnyPublisher()
    }
    
    public func updateTemperature(_ setting: TemperatureSetting) throws {
        let updatedSettings = settingsPublisher.value.updated(temperature: setting)
        settingsPublisher.send(updatedSettings)
    }
}
