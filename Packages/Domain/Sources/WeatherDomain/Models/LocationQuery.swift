//
//  LocationQuery.swift
//  WeatherDomain
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import CommonDomain
import Foundation

public enum LocationQuery: Equatable, Hashable, Identifiable, Sendable {
    case name(String)
    case freeform(String)
    case coordinate(GeographicCoordinate)
    
    public var id: String {
        switch self {
        case .name(let string):
            string
        case .freeform(let string):
            string
        case .coordinate(let geographicCoordinate):
            geographicCoordinate.id
        }
    }
    
    public static let `default`: LocationQuery = .freeform("Dallas")
}
