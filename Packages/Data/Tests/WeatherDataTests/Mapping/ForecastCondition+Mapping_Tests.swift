//
//  ForecastCondition+Mapping_Tests.swift
//  WeatherDataTests
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import Testing
@testable import WeatherData
import WeatherDomain

struct ForecastConditionMapping_Tests {
    
    @Test func testDomainModelMapping() async throws {
        let networkModel = ConditionInnerResponseModel(
            code: 1183,
            icon: "//cdn.weatherapi.com/weather/64x64/day/296.png",
            text: "Light rain")
        
        let domainModel = ForecastCondition(from: networkModel)
        
        #expect(domainModel.id == 1183)
        #expect(domainModel.text == "Light rain")
        #expect(domainModel.icon == URL(string: "https://cdn.weatherapi.com/weather/64x64/day/296.png"))
    }
}
