//
//  LocationForecastStatsViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

struct LocationForecastStatsViewState: Mockable {
    struct ItemViewState: Identifiable, Mockable {
        let id: String
        let title: String
        let value: String
        let systemImage: String
        
        static func mock(values: MockValues<LocationForecastStatsViewState.ItemViewState>) -> LocationForecastStatsViewState.ItemViewState {
            ItemViewState(
                id: values.get(\.id, defaultValue: UUID().uuidString),
                title: values.get(\.title, defaultValue: "Title"),
                value: values.get(\.value, defaultValue: "Value"),
                systemImage: values.get(\.systemImage, defaultValue: "questionmark"))
        }
    }
    
    let items: [ItemViewState]
    
    static func mock(values: MockValues<LocationForecastStatsViewState>) -> LocationForecastStatsViewState {
        LocationForecastStatsViewState(
            items: values.get(\.items, defaultValue: [
                .mock(),
                .mock(),
                .mock()
            ]))
    }
}
