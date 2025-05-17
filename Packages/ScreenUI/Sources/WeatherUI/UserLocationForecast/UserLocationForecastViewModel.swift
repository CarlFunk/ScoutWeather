//
//  UserLocationForecastViewModel.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleDependency
import AmpleNavigation
import Combine
import LocationDomain
import SharedUI
import SwiftUI
import WeatherDomain

@Observable public final class UserLocationForecastViewModel {
    @ObservationIgnored @Dependency private var locationRepository: LocationRepository
    
    private var coordinator: NavigationCoordinator<AppScreen>
    private var locationCancellable: AnyCancellable?
    
    var viewState: UserLocationForecastViewState
    
    public init(coordinator: NavigationCoordinator<AppScreen> = NavigationCoordinator()) {
        self.coordinator = coordinator
        self.viewState = UserLocationForecastViewState.loading
    }
    
    func viewAppeared() {
        switch viewState {
        case .loading:
            requestLocation()
        case .locationForecast:
            break
        case .error:
            break
        case .defaultLocationForecast:
            requestLocation()
        }
    }
    
    func requestLocation() {
        locationCancellable = locationRepository.getUserLocation()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                if case .failure(let error) = completion {
                    self.viewState = .defaultLocationForecast(LocationQuery.default, self.coordinator)
                }
            } receiveValue: { [weak self] userLocation in
                guard let self else { return }
                self.viewState = .locationForecast(LocationQuery.coordinate(userLocation.coordinate), self.coordinator)
            }
    }
}
