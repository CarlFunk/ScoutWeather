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
    
    var locationViewModel: LocationForecastViewModel
    var viewState: UserLocationForecastViewState
    
    public init(coordinator: NavigationCoordinator<AppScreen> = NavigationCoordinator()) {
        self.coordinator = coordinator
        self.locationViewModel = LocationForecastViewModel(location: .freeform(""), coordinator: coordinator)
        self.viewState = UserLocationForecastViewState(isLoading: true)
    }
    
    func viewAppeared() {
        if viewState.isLoading {
            requestLocation()
        }
    }
    
    func dismissBanner() {
        viewState = viewState.updated(bannerViewState: nil)
    }
    
    func requestLocation() {
        locationCancellable = locationRepository.getUserLocation()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self else { return }
                if case Subscribers.Completion.failure(let error) = completion {
                    switch error {
                    case .failedToObtainLocation, .unknownPermissionState:
                        self.viewState = viewState.updated(
                            bannerViewState: BannerViewState(
                                title: "Failed to obtain location to show weather for your area. Check out the app anyways."))
                    case .userDeniedRequest:
                        self.viewState = viewState.updated(
                            bannerViewState: BannerViewState(
                                title: "Grant the app location permissions to view weather for your area.\n\nGo to Settings > Apps > ScoutWeather > Location."))
                    }
                    
                    self.locationViewModel.updated(location: .default)
                }
            } receiveValue: { [weak self] userLocation in
                guard let self else { return }
                self.locationViewModel.updated(location: .coordinate(userLocation.coordinate))
                self.viewState = viewState.updated(isLoading: false)
            }
    }
}
