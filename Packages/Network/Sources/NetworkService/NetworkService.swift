//
//  NetworkService.swift
//  NetworkService
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine
import Foundation
import NetworkCore

open class NetworkService: NetworkServicing {
    public let base: String
    public let session: URLSession
    
    public let authDelegate: (any NetworkAuthDelegate)?
    
    public init(
        base: String,
        session: URLSession = .shared,
        authDelegate: (any NetworkAuthDelegate)? = nil
    ) {
        self.base = base
        self.session = session
        self.authDelegate = authDelegate
    }
    
    public func request(with request: any NetworkRequestable) -> AnyPublisher<Data, NetworkError> {
        do {
            let baseURL = try buildBaseURL(from: base)
            let request = request.buildRequest(baseURL: baseURL)
            logRequest(request: request)
            return session.dataTaskPublisher(for: request)
                .handleEvents(
                    receiveOutput: { [weak self] (data, response) in
                        guard let self else { return }
                        self.logData(data: data, response: response)
                    }
                )
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw NetworkError.invalidResponse
                    }
                    
                    return try self.mapData(data: data, httpResponse: httpResponse)
                }
                .mapError { error -> NetworkError in
                    if let networkError = error as? NetworkError {
                        return networkError
                    }
                    return NetworkError.connectivity
                }
                .eraseToAnyPublisher()
        } catch let networkError as NetworkError {
            return Fail(error: networkError)
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: NetworkError.invalidRequest)
                .eraseToAnyPublisher()
        }
    }
    
    open func logRequest(request: URLRequest) {
        print("""
        ----------
        REQUEST:
        URL: \(request.url ?? URL(string: "https://unknown.com")!)
        Method: \(request.httpMethod ?? "")
        Headers: \(request.allHTTPHeaderFields ?? [:])
        Data: \(request.httpBody?.prettyPrinted() ?? "")
        ----------
        """)
    }
    
    open func logData(data: Data, response: URLResponse) {
        let httpResponse = response as? HTTPURLResponse
        
        print("""
        ----------
        RESPONSE:
        URL: \(response.url ?? URL(string: "https://unknown.com")!)
        Code: \(httpResponse?.statusCode ?? -1)
        Data: \(data.prettyPrinted() ?? "")
        ----------
        """)
    }
    
    open func mapData(data: Data, httpResponse: HTTPURLResponse) throws -> Data {
        switch httpResponse.statusCode {
        case 200...299:
            return data
        case 400:
            throw NetworkError.invalidRequest
        case 401:
            throw NetworkError.unauthorized
        case 403:
            throw NetworkError.restricted
        default:
            throw NetworkError.invalidResponse
        }
    }
    
    open func buildBaseURL(from base: String) throws -> URL {
        guard let baseURL = URL(string: base) else {
            throw NetworkError.malformedBaseURL
        }
        return baseURL
    }
}
