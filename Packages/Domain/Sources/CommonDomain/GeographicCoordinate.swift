//
//  GeographicCoordinate.swift
//  CommonDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

public struct GeographicCoordinate: Equatable, Hashable, Identifiable, Mockable, Sendable {
    public let latitude: Double
    public let longitude: Double
    
    public init(
        latitude: Double,
        longitude: Double
    ) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public var id: String {
        return "\(latitude),\(longitude)"
    }
    
    public static func mock(values: MockValues<GeographicCoordinate>) -> GeographicCoordinate {
        GeographicCoordinate(
            latitude: values.get(\.latitude, defaultValue: 32.78),
            longitude: values.get(\.longitude, defaultValue: -96.8))
    }
}
