//
//  LocationRepository.swift
//  LocationDomain
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine

public protocol LocationRepository {
    func getUserLocation() -> AnyPublisher<UserLocation, LocationError>
}
