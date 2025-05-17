//
//  LocationForecastHeaderViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation
import WeatherDomain

struct LocationForecastHeaderViewState: Mockable {
    let name: String
    let region: String
    let condition: String
    let conditionIcon: URL?
    
    static func mock(values: MockValues<LocationForecastHeaderViewState>) -> LocationForecastHeaderViewState {
        LocationForecastHeaderViewState(
            name: values.get(\.name, defaultValue: "Dallas"),
            region: values.get(\.region, defaultValue: "Texas"),
            condition: values.get(\.condition, defaultValue: "Sunny"),
            conditionIcon: values.get(\.conditionIcon, defaultValue: URL.mockImage)
        )
    }
}

extension LocationForecastHeaderViewState {
    init(from location: ForecastLocation, condition: ForecastCondition) {
        self.init(
            name: location.name,
            region: location.region,
            condition: condition.text,
            conditionIcon: condition.icon
        )
    }
}
