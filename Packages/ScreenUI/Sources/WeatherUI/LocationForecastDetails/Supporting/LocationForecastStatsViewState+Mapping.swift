//
//  LocationForecastStatsViewState+Mapping.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import WeatherDomain

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
