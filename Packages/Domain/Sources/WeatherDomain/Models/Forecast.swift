//
//  Forecast.swift
//  WeatherDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import CommonDomain
import Foundation

public struct Forecast: Mockable {
    public let currentCondition: ForecastCondition
    public let location: ForecastLocation
    public let days: [ForecastDay]
    
    public init(
        currentCondition: ForecastCondition,
        location: ForecastLocation,
        days: [ForecastDay]
    ) {
        self.currentCondition = currentCondition
        self.location = location
        self.days = days
    }
    
    public static func mock(values: MockValues<Forecast>) -> Forecast {
        Forecast(
            currentCondition: ForecastCondition(
                id: values.get(\.currentCondition.id, defaultValue: Int.random(in: 1000...1100)),
                text: values.get(\.currentCondition.text, defaultValue: "Patchy rain nearby"),
                icon: values.get(\.currentCondition.icon, defaultValue: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/176.png"))
            ),
            location: ForecastLocation(
                name: values.get(\.location.name, defaultValue: ForecastLocation.mock().name),
                region: values.get(\.location.region, defaultValue: ForecastLocation.mock().region),
                country: values.get(\.location.country, defaultValue: ForecastLocation.mock().country),
                timeZone: values.get(\.location.timeZone, defaultValue: ForecastLocation.mock().timeZone),
                query: values.get(\.location.query, defaultValue: ForecastLocation.mock().query),
                coordinate: GeographicCoordinate(
                    latitude: values.get(\.location.coordinate.latitude, defaultValue: GeographicCoordinate.mock().latitude),
                    longitude: values.get(\.location.coordinate.longitude, defaultValue: GeographicCoordinate.mock().longitude))
            ),
            days: values.get(\.days, defaultValue: [.mock()])
        )
    }
}
