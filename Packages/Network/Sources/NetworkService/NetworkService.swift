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
    
    public init(
        base: String,
        session: URLSession = .shared
    ) {
        self.base = base
        self.session = session
    }
    
    public func request(with request: any NetworkRequestable) -> AnyPublisher<Data, NetworkError> {
        do {
            let baseURL = try buildBaseURL(from: base)
            let request = try request.buildRequest(baseURL: baseURL)
            return session.dataTaskPublisher(for: request)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw NetworkError.invalidResponse
                    }
                    
                    return try self.mapData(data: data, httpResponse: httpResponse)
                }
                .mapError { sessionError -> NetworkError in
                    NetworkError.connectivity
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
    
    private func buildBaseURL(from base: String) throws -> URL {
        guard let baseURL = URL(string: base) else {
            throw NetworkError.malformedBaseURL
        }
        return baseURL
    }
}
