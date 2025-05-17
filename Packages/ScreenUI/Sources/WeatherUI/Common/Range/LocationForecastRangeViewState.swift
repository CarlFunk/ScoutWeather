//
//  LocationForecastRangeViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation
import SettingsDomain
import WeatherDomain

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

extension LocationForecastRangeViewState {
    init(from domainModel: ForecastDay, settings: Settings) {
        self.init(
            min: domainModel.minTemperature.converted(to: settings.temperature.unit)
                .formatted(.measurement(
                    width: .abbreviated,
                    usage: .asProvided,
                    numberFormatStyle: .number.precision(.integerAndFractionLength(integerLimits: 1...3, fractionLimits: 0...0))
                )),
            average: domainModel.avgTemperature.converted(to: settings.temperature.unit)
                .formatted(.measurement(
                    width: .abbreviated,
                    usage: .asProvided,
                    numberFormatStyle: .number.precision(.integerAndFractionLength(integerLimits: 1...3, fractionLimits: 0...0))
                )),
            max: domainModel.maxTemperature.converted(to: settings.temperature.unit)
                .formatted(.measurement(
                    width: .abbreviated,
                    usage: .asProvided,
                    numberFormatStyle: .number.precision(.integerAndFractionLength(integerLimits: 1...3, fractionLimits: 0...0))
                ))
        )
    }
}
