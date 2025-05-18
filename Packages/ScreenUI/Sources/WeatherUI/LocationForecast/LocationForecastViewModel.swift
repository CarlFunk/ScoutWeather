//
//  LocationForecastViewModel.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/12/25.
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

@Observable public final class LocationForecastViewModel {
    @ObservationIgnored @Dependency private var settingsRepository: SettingsRepository
    @ObservationIgnored @Dependency private var weatherRepository: WeatherRepository
    
    private let coordinator: NavigationCoordinator<AppScreen>
    
    private var loadDataCancellable: AnyCancellable?
    
    private(set) var location: LocationQuery
    private(set) var forecast: Forecast
    private(set) var settings: Settings
    
    var viewState: LocationForecastViewState
    
    public init(
        location: LocationQuery = .default,
        forecast: Forecast = .mock(),
        settings: Settings = .mock(),
        coordinator: NavigationCoordinator<AppScreen> = NavigationCoordinator()
    ) {
        self.location = location
        self.forecast = forecast
        self.settings = settings
        self.coordinator = coordinator
        self.viewState = LocationForecastViewState(forecast: forecast, settings: settings, isLoading: true)
    }
    
    func viewAppeared() {
        if viewState.isLoading {
            loadData()
        }
    }
    
    func updated(location: LocationQuery) {
        self.location = location
        
        viewState = viewState.updated(isLoading: true)
        loadData()
    }
    
    func viewForecast(id: String) {
        guard let forecastDay = forecast.days.first(where: { $0.id == id }) else {
            return
        }
        
        coordinator.navigate(to: .forecastDetails(location: forecast.location, forecastDay: forecastDay))
    }
    
    func updateTemperatureSetting(id: String) {
        guard let temperature = TemperatureSetting(id: id) else { return }
        
        do {
            try settingsRepository.updateTemperature(temperature)
        } catch {
            print(error)
        }
    }
    
    func dismissAlert() {
        viewState = viewState.updated(alertViewState: nil)
    }
    
    private func loadData() {
        guard !location.id.isEmpty else { return }
        
        loadDataCancellable = Publishers.CombineLatest(
            weatherRepository.getForecast(request: ForecastRequest(location: location)),
            settingsRepository.subscribeSettings()
                .setFailureType(to: Error.self)
        )
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            guard let self else { return }
            guard case .failure(let error) = completion else {
                return
            }
            
            self.viewState = self.viewState.updated(
                alertViewState: .error(
                    error,
                    retry: { [weak self] in
                        guard let self else { return }
                        self.loadData()
                    }))
        } receiveValue: { [weak self] forecast, settings in
            guard let self else { return }
            self.forecast = forecast
            self.settings = settings
            self.update(with: forecast, and: settings)
        }
    }
    
    private func update(with forecast: Forecast, and settings: Settings) {
        viewState = LocationForecastViewState(forecast: forecast, settings: settings, isLoading: false)
    }
}
