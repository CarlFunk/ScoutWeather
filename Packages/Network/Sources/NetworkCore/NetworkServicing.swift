//
//  NetworkServicing.swift
//  NetworkCore
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Combine
import Foundation

public protocol NetworkServicing {
    var authDelegate: NetworkAuthDelegate? { get }
    
    func request(with request: NetworkRequestable) -> AnyPublisher<Data, NetworkError>
}
