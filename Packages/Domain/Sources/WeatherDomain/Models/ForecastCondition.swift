//
//  ForecastCondition.swift
//  WeatherDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

public struct ForecastCondition: Equatable, Hashable, Identifiable, Mockable {
    public let id: Int
    public let text: String
    public let icon: URL?
    
    public init(
        id: Int,
        text: String,
        icon: URL?
    ) {
        self.id = id
        self.text = text
        self.icon = icon
    }
    
    public static func mock(values: MockValues<ForecastCondition>) -> ForecastCondition {
        ForecastCondition(
            id: values.get(\.id, defaultValue: Int.random(in: 1000...1100)),
            text: values.get(\.text, defaultValue: "Patchy rain nearby"),
            icon: values.get(\.icon, defaultValue: URL(string: "https://cdn.weatherapi.com/weather/64x64/day/176.png"))
        )
    }
}
