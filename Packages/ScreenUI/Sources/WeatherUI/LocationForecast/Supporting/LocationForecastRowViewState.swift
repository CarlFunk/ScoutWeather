//
//  LocationForecastRowViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

struct LocationForecastRowViewState: Identifiable, Mockable {
    let id: String
    let date: String
    let range: LocationForecastRangeViewState
    let conditionIcon: URL?
    let conditionText: String
    
    static func mock(values: MockValues<LocationForecastRowViewState>) -> LocationForecastRowViewState {
        LocationForecastRowViewState(
            id: values.get(\.id, defaultValue: UUID().uuidString),
            date: values.get(\.date, defaultValue: "Monday"),
            range: values.get(\.range, defaultValue: .mock()),
            conditionIcon: values.get(\.conditionIcon, defaultValue: URL.mockImage),
            conditionText: values.get(\.conditionText, defaultValue: "Patchy rain nearby")
        )
    }
}
