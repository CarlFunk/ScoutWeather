//
//  ForecastLocation+Mapping.swift
//  WeatherData
//
//  Created by Carl Funk on 5/13/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import CommonDomain
import Foundation
import WeatherDomain

extension ForecastLocation {
    init(from networkModel: LocationInnerResponseModel, request: ForecastRequest) {
        self.init(
            name: networkModel.name,
            region: networkModel.region,
            country: networkModel.country,
            timeZone: TimeZone(identifier: networkModel.timeZoneName) ?? .current,
            query: request.location,
            coordinate: GeographicCoordinate(
                latitude: networkModel.latitude,
                longitude: networkModel.longitude)
        )
    }
}
