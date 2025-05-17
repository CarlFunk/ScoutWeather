//
//  LiveSettingsRepository.swift
//  SettingsData
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine
import Foundation
import SettingsDomain

public final class LiveSettingsRepository: SettingsRepository {
    static let storageKey = "settings"
    
    let settingsPublisher: CurrentValueSubject<Settings, Never>
    
    public init() {
        var storageSettings: StorageSettings?
        if let storageData = UserDefaults.standard.data(forKey: Self.storageKey), let storageModel = try? JSONDecoder().decode(StorageSettings.self, from: storageData) {
            storageSettings = storageModel
        }
        
        let settings = Settings(from: storageSettings)
        settingsPublisher = CurrentValueSubject<Settings, Never>(settings)
    }
    
    public func subscribeSettings() -> AnyPublisher<Settings, Never> {
        settingsPublisher
            .eraseToAnyPublisher()
    }
    
    public func updateTemperature(_ setting: TemperatureSetting) throws {
        let updatedSettings = settingsPublisher.value.updated(temperature: setting)
        try store(updatedSettings)
        settingsPublisher.send(updatedSettings)
    }
    
    private func store(_ settings: Settings) throws {
        let storageModel = settings.storageModel
        
        do {
            let storageData = try JSONEncoder().encode(storageModel)
            UserDefaults.standard.set(storageData, forKey: Self.storageKey)
        } catch {
            throw SettingsRepositoryError.failedToUpdateSettings
        }
    }
}
