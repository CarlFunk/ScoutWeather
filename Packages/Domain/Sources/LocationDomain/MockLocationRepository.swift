//
//  MockLocationRepository.swift
//  LocationDomain
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine

public final class MockLocationRepository: LocationRepository {
    public init() { }
    
    public func getUserLocation() -> AnyPublisher<UserLocation, LocationError> {
        Just<UserLocation>(.mock())
            .setFailureType(to: LocationError.self)
            .eraseToAnyPublisher()
    }
}
