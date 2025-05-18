//
//  LocationForecastRangeViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

struct LocationForecastRangeViewState: Mockable {
    let min: String
    let average: String
    let max: String
    
    static func mock(values: MockValues<LocationForecastRangeViewState>) -> LocationForecastRangeViewState {
        LocationForecastRangeViewState(
            min: values.get(\.min, defaultValue: "76°F"),
            average: values.get(\.average, defaultValue: "88°F"),
            max: values.get(\.max, defaultValue: "96°F")
        )
    }
}
