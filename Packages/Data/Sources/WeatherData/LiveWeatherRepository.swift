//
//  LiveWeatherRepository.swift
//  WeatherData
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleDependency
import Combine
import Foundation
import NetworkCore
import WeatherDomain

public final class LiveWeatherRepository: WeatherRepository {
    @Dependency(name: "Weather") var networkService: NetworkServicing
    
    public init() { }
    
    public func getForecast(request: ForecastRequest) -> AnyPublisher<Forecast, any Error> {
        networkService.request(with: request.networkRequest)
            .decode(type: ForecastNetworkResponse.self, decoder: JSONDecoder())
            .map { networkModel in
                Forecast(from: networkModel, request: request)
            }
            .eraseToAnyPublisher()
    }
}
