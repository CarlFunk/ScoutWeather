//
//  LocationForecastStatsViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation
import WeatherDomain

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

extension LocationForecastStatsViewState {
    init(from domainModel: ForecastDay) {
        self.init(
            items: [
                ItemViewState(
                    id: "humidity",
                    title: "Humidity",
                    value: domainModel.avgHumidity.formatted(.percent),
                    systemImage: "drop"),
                ItemViewState(
                    id: "rain_chance",
                    title: "Rain",
                    value: domainModel.rainPossibility.formatted(.percent),
                    systemImage: "cloud.rain"),
                ItemViewState(
                    id: "snow_chance",
                    title: "Snow",
                    value: domainModel.snowPossibility.formatted(.percent),
                    systemImage: "cloud.snow")
            ]
        )
    }
}
