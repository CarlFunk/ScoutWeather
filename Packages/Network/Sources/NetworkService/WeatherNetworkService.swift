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
    public init(
        session: URLSession = .shared,
        authDelegate: (any NetworkAuthDelegate)? = nil
    ) {
        super.init(base: "https://api.weatherapi.com", session: session, authDelegate: authDelegate)
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
    
    public override func buildBaseURL(from base: String) throws -> URL {
        var baseURL = try super.buildBaseURL(from: base)
        
        if let key = authDelegate?.authorizationToken() {
            baseURL = baseURL.appending(
                queryItems: [
                    URLQueryItem(name: "key", value: key)
                ])
        }
        
        return baseURL
    }
    
    private struct ErrorResponse: Codable {
        var code: Int
        var message: String
    }
}
