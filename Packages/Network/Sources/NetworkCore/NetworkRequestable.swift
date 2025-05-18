//
//  NetworkRequestable.swift
//  NetworkCore
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

public protocol NetworkRequestable {
    var data: Data? { get }
    var method: NetworkMethod { get }
    var headers: [String: String] { get }
    var query: [String: String] { get }
    
    func buildURL(baseURL: URL) -> URL
    func buildRequest(baseURL: URL) -> URLRequest
}

public extension NetworkRequestable {
    var data: Data? {
        nil
    }
    
    var headers: [String: String] {
        [:]
    }
    
    var query: [String: String] {
        [:]
    }
    
    func buildRequest(baseURL: URL) -> URLRequest {
        var request = URLRequest(url: buildURL(baseURL: baseURL))
        request.httpMethod = method.value
        request.allHTTPHeaderFields = headers
        request.httpBody = data
        return request
    }
}
