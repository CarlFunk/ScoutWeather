//
//  ForecastNetworkRequest.swift
//  WeatherData
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import NetworkCore
import Foundation

final class ForecastNetworkRequest: NetworkRequestable {
    let location: String
    let days: Int
    
    var method: NetworkMethod {
        .get
    }
    
    init(location: String, days: Int) {
        self.location = location
        self.days = days
    }
    
    func buildURL(baseURL: URL) throws -> URL {
        return baseURL
            .appending(path: "v1")
            .appending(path: "forecast.json")
            .appending(queryItems: [
                URLQueryItem(name: "key", value: "REPLACE_ME"),
                URLQueryItem(name: "q", value: location),
                URLQueryItem(name: "days", value: String(days))
            ])
    }
}
