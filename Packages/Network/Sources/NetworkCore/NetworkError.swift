//
//  NetworkError.swift
//  NetworkCore
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

public enum NetworkError: Error {
    case connectivity
    case invalidRequest
    case invalidResponse
    case malformedBaseURL
    case rateLimited
    case restricted
    case unauthorized
    case unknown
}
