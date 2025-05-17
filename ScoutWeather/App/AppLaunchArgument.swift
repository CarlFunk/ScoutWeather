//
//  AppLaunchArgument.swift
//  ScoutWeather
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

final class AppLaunchArgument {
    enum Argument: String {
        case useMockServices = "UseMockServices"
    }
    
    static func isEnabled(_ argument: Argument) -> Bool {
        ProcessInfo.processInfo.arguments.contains(where: { $0 == argument.rawValue })
    }
}
