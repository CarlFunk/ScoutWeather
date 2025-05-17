//
//  LocationForecastDetailsViewModel.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleDependency
import AmpleMock
import AmpleNavigation
import Combine
import SettingsDomain
import SharedUI
import SwiftUI
import WeatherDomain

@Observable public final class LocationForecastDetailsViewModel {
    @ObservationIgnored @Dependency private var settingsRepository: SettingsRepository
    
    private var location: ForecastLocation
    private var forecastDay: ForecastDay
    private var settings: Settings
    private var coordinator: NavigationCoordinator<AppScreen>
    private var loadDataCancellable: AnyCancellable?
    
    var viewState: LocationForecastDetailsViewState
    
    public init(
        location: ForecastLocation,
        forecastDay: ForecastDay,
        settings: Settings = .mock(),
        coordinator: NavigationCoordinator<AppScreen> = NavigationCoordinator()
    ) {
        self.location = location
        self.forecastDay = forecastDay
        self.settings = settings
        self.coordinator = coordinator
        self.viewState = LocationForecastDetailsViewState(location: location, forecastDay: forecastDay, settings: settings)
    }
    
    func viewAppeared() {
        initialLoad()
    }
    
    func initialLoad() {
        loadDataCancellable = settingsRepository.subscribeSettings()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] settings in
                guard let self else { return }
                self.settings = settings
                self.viewState = LocationForecastDetailsViewState(location: location, forecastDay: forecastDay, settings: settings)
            }
    }
}
