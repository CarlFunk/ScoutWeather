//
//  ForecastDay.swift
//  WeatherDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import CommonDomain
import Foundation

public struct ForecastDay: Equatable, Hashable, Identifiable, Mockable {
    public let date: Date
    public let maxTemperature: Measurement<UnitTemperature>
    public let minTemperature: Measurement<UnitTemperature>
    public let avgTemperature: Measurement<UnitTemperature>
    public let avgHumidity: Percentage
    public let rainPossibility: Percentage
    public let snowPossibility: Percentage
    public let condition: ForecastCondition
    
    public init(
        date: Date,
        maxTemperature: Measurement<UnitTemperature>,
        minTemperature: Measurement<UnitTemperature>,
        avgTemperature: Measurement<UnitTemperature>,
        avgHumidity: Percentage,
        rainPossibility: Percentage,
        snowPossibility: Percentage,
        condition: ForecastCondition
    ) {
        self.date = date
        self.maxTemperature = maxTemperature
        self.minTemperature = minTemperature
        self.avgTemperature = avgTemperature
        self.avgHumidity = avgHumidity
        self.rainPossibility = rainPossibility
        self.snowPossibility = snowPossibility
        self.condition = condition
    }
    
    public func dayOfWeekFormatted() -> String {
        date.formatted(.dateTime.weekday(.wide)).capitalized
    }
    
    public var id: String {
        date.formatted(.iso8601)
    }
    
    public static func mock(values: MockValues<ForecastDay>) -> ForecastDay {
        ForecastDay(
            date: values.get(\.date, defaultValue: .now),
            maxTemperature: values.get(\.maxTemperature, defaultValue: Measurement(value: 96, unit: .fahrenheit)),
            minTemperature: values.get(\.minTemperature, defaultValue: Measurement(value: 76, unit: .fahrenheit)),
            avgTemperature: values.get(\.avgTemperature, defaultValue: Measurement(value: 88, unit: .fahrenheit)),
            avgHumidity: values.get(\.avgHumidity, defaultValue: 60),
            rainPossibility: values.get(\.rainPossibility, defaultValue: 5),
            snowPossibility: values.get(\.snowPossibility, defaultValue: 0),
            condition: ForecastCondition(
                id: values.get(\.condition.id, defaultValue: ForecastCondition.mock().id),
                text: values.get(\.condition.text, defaultValue: ForecastCondition.mock().text),
                icon: values.get(\.condition.icon, defaultValue: ForecastCondition.mock().icon))
        )
    }
}
