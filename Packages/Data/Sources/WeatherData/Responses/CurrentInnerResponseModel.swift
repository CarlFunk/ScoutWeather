//
//  CurrentInnerResponseModel.swift
//  WeatherData
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

public struct CurrentInnerResponseModel: Codable {
    enum CodingKeys: String, CodingKey {
        case condition
    }
    
    public let condition: ConditionInnerResponseModel
}
