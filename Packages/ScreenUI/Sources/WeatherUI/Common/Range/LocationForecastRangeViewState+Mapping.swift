//
//  LocationForecastRangeViewState+Mapping.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SettingsDomain
import WeatherDomain

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
