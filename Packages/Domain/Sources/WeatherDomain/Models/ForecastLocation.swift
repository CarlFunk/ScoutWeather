//
//  ForecastLocation.swift
//  WeatherDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import CommonDomain
import Foundation

public struct ForecastLocation: Equatable, Hashable, Identifiable, Mockable {
    public let name: String
    public let region: String
    public let country: String
    public let query: LocationQuery
    public let coordinate: GeographicCoordinate
    
    public init(
        name: String,
        region: String,
        country: String,
        query: LocationQuery,
        coordinate: GeographicCoordinate
    ) {
        self.name = name
        self.region = region
        self.country = country
        self.query = query
        self.coordinate = coordinate
    }
    
    public var id: String {
        query.id
    }
    
    public static func mock(values: MockValues<ForecastLocation>) -> ForecastLocation {
        ForecastLocation(
            name: values.get(\.name, defaultValue: "Dallas"),
            region: values.get(\.region, defaultValue: "Texas"),
            country: values.get(\.country, defaultValue: "United States of America"),
            query: values.get(\.query, defaultValue: .name("dallas-texas-united-states-of-america")),
            coordinate: GeographicCoordinate(
                latitude: values.get(\.coordinate.latitude, defaultValue: GeographicCoordinate.mock().latitude),
                longitude: values.get(\.coordinate.longitude, defaultValue: GeographicCoordinate.mock().longitude))
        )
    }
}
