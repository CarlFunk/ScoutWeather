//
//  UserLocation.swift
//  LocationDomain
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import CommonDomain

public struct UserLocation: Mockable {
    public let coordinate: GeographicCoordinate
    
    public init(coordinate: GeographicCoordinate) {
        self.coordinate = coordinate
    }
    
    public static func mock(values: MockValues<UserLocation>) -> UserLocation {
        UserLocation(
            coordinate: values.get(\.coordinate, defaultValue: .mock()))
    }
}
