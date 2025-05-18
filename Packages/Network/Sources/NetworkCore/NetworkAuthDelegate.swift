//
//  NetworkAuthDelegate.swift
//  NetworkCore
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

public protocol NetworkAuthDelegate {
    func authorizationToken() -> String
}
