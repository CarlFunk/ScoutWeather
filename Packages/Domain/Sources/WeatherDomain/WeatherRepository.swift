//
//  WeatherRepository.swift
//  WeatherDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine
import Foundation

public protocol WeatherRepository {
    func getForecast(
        request: ForecastRequest,
        ignoreCache: Bool
    ) -> AnyPublisher<Forecast, Error>
}

public extension WeatherRepository {
    func getForecast(
        request: ForecastRequest
    ) -> AnyPublisher<Forecast, Error> {
        getForecast(request: request, ignoreCache: false)
    }
}
