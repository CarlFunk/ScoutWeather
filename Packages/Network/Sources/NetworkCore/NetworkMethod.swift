//
//  NetworkMethod.swift
//  NetworkCore
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

public enum NetworkMethod {
    case get
    
    public var value: String {
        switch self {
        case .get:  "GET"
        }
    }
}
