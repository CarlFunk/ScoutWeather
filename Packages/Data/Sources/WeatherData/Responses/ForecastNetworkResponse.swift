//
//  ForecastNetworkResponse.swift
//  WeatherData
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

public struct ForecastNetworkResponse: Codable {
    public let current: CurrentInnerResponseModel
    public let forecast: ForecastInnerResponseModel
    public let location: LocationInnerResponseModel
}
