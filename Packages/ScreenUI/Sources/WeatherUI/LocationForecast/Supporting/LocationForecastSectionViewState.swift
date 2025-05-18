//
//  LocationForecastSectionViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

struct LocationForecastSectionViewState: Mockable {
    let rows: [LocationForecastRowViewState]
    
    static func mock(values: MockValues<LocationForecastSectionViewState>) -> LocationForecastSectionViewState {
        LocationForecastSectionViewState(
            rows: [
                .mock(values: .include(\.date, value: "Monday")),
                .mock(values: .include(\.date, value: "Tuesday")),
                .mock(values: .include(\.date, value: "Wednesday")),
                .mock(values: .include(\.date, value: "Thursday")),
                .mock(values: .include(\.date, value: "Friday")),
                .mock(values: .include(\.date, value: "Saturday")),
                .mock(values: .include(\.date, value: "Sunday"))
            ]
        )
    }
}
