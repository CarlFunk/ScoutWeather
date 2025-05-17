//
//  ForecastCondition+Mapping.swift
//  WeatherData
//
//  Created by Carl Funk on 5/13/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import WeatherDomain

extension ForecastCondition {
    init(from networkModel: ConditionInnerResponseModel) {
        var urlComponents = URLComponents(string: networkModel.icon)
        urlComponents?.scheme = "https"
        
        self.init(
            id: networkModel.code,
            text: networkModel.text,
            icon: urlComponents?.url
        )
    }
}
