//
//  ForecastNetworkRequest_Tests.swift
//  WeatherDataTests
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import Testing
@testable import WeatherData

struct ForecastNetworkRequest_Tests {
    let location: String = "Dallas"
    let days: Int = 5
    
    @Test func testRequestPathSetProperly() async throws {
        let baseURL = URL(string: "https://example.com")!
        let request = ForecastNetworkRequest(location: location, days: days)
        let requestURL = request.buildURL(baseURL: baseURL)
        let requestURLPath = requestURL.path(percentEncoded: false)
        
        #expect(requestURLPath == "/v1/forecast.json")
    }
    
    @Test func testRequestQueryParametersSetProperly() async throws {
        let baseURL = URL(string: "https://example.com")!
        let request = ForecastNetworkRequest(location: location, days: days)
        let requestURL = request.buildURL(baseURL: baseURL)
        
        guard let query = requestURL.query(percentEncoded: false), !query.isEmpty else {
            Issue.record("Query is nil or empty")
            return
        }
        
        let splitQuery = query.components(separatedBy: "&")
        let queryItems = Dictionary(uniqueKeysWithValues: splitQuery.map { queryItem in
            let queryItemParts = queryItem.components(separatedBy: "=")
            return (queryItemParts.first!, queryItemParts.last!)
        })
        
        let expectedQueryItems = [
            "q": location,
            "days": "\(days)"
        ]
        
        #expect(queryItems == expectedQueryItems)
    }
}
