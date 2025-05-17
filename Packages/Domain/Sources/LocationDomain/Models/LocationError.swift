//
//  LocationError.swift
//  LocationDomain
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

public enum LocationError: Error {
    case userDeniedRequest
    case failedToObtainLocation
    case unknownPermissionState
}
