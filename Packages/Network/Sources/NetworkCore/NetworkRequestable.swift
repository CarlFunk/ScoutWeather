//
//  NetworkRequestable.swift
//  NetworkCore
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

public protocol NetworkRequestable {
    var method: NetworkMethod { get }
    var headers: [String: String] { get }
    var query: [String: String] { get }
    
    func buildURL(baseURL: URL) throws -> URL
    func buildRequest(baseURL: URL) throws -> URLRequest
}

public extension NetworkRequestable {
    var headers: [String: String] {
        [:]
    }
    
    var query: [String: String] {
        [:]
    }
    
    func buildRequest(baseURL: URL) throws -> URLRequest {
        var request = URLRequest(url: try buildURL(baseURL: baseURL))
        request.httpMethod = method.value
        request.allHTTPHeaderFields = headers
        return request
    }
}
