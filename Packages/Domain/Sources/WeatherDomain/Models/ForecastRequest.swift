//
//  ForecastRequest.swift
//  WeatherDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

public struct ForecastRequest {
    public let location: LocationQuery
    public let days: Int
    
    public init(
        location: LocationQuery,
        days: Int = 7
    ) {
        self.location = location
        self.days = days
    }
}
