//
//  WeatherNetworkService.swift
//  NetworkService
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import NetworkCore

public final class WeatherNetworkService: NetworkService {
    public init(session: URLSession = .shared) {
        super.init(base: "https://api.weatherapi.com", session: session)
    }
    
    public override func mapData(data: Data, httpResponse: HTTPURLResponse) throws -> Data {
        switch httpResponse.statusCode {
        case 200:
            return data
        case 400:
            throw NetworkError.invalidRequest
        case 401:
            throw NetworkError.unauthorized
        case 403:
            if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data), errorResponse.code == 2007 {
                throw NetworkError.rateLimited
            }
            throw NetworkError.restricted
        default:
            throw NetworkError.invalidResponse
        }
    }
    
    private struct ErrorResponse: Codable {
        var code: Int
        var message: String
    }
}
