//
//  UserLocationForecastViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleNavigation
import SharedUI
import WeatherDomain

struct UserLocationForecastViewState {
    let isLoading: Bool
    let bannerViewState: BannerViewState?
    
    init(
        isLoading: Bool,
        bannerViewState: BannerViewState? = nil
    ) {
        self.isLoading = isLoading
        self.bannerViewState = bannerViewState
    }
    
    func updated(bannerViewState: BannerViewState?) -> UserLocationForecastViewState{
        UserLocationForecastViewState(
            isLoading: isLoading,
            bannerViewState: bannerViewState)
    }
    
    func updated(isLoading: Bool) -> UserLocationForecastViewState {
        UserLocationForecastViewState(
            isLoading: isLoading,
            bannerViewState: bannerViewState)
    }
}
