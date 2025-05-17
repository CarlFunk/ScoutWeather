//
//  MockWeatherRepository.swift
//  WeatherDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine
import Foundation

public final class MockWeatherRepository: WeatherRepository {
    static let dayInSeconds: Double = 86400
    
    public init() { }
    
    public func getForecast(request: ForecastRequest, ignoreCache: Bool) -> AnyPublisher<Forecast, any Error> {
        Just<Forecast>(
            Forecast.mock(
                values: .include(
                    \.days,
                     value: [
                        .mock(values: .include(\.date, value: .now)),
                        .mock(values: .include(\.date, value: .now.addingTimeInterval(Self.dayInSeconds * 1))),
                        .mock(values: .include(\.date, value: .now.addingTimeInterval(Self.dayInSeconds * 2))),
                        .mock(values: .include(\.date, value: .now.addingTimeInterval(Self.dayInSeconds * 3))),
                        .mock(values: .include(\.date, value: .now.addingTimeInterval(Self.dayInSeconds * 4))),
                        .mock(values: .include(\.date, value: .now.addingTimeInterval(Self.dayInSeconds * 5))),
                        .mock(values: .include(\.date, value: .now.addingTimeInterval(Self.dayInSeconds * 6)))
                     ]))
        )
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
}
