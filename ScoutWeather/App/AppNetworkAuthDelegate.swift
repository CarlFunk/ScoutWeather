//
//  AppNetworkAuthDelegate.swift
//  ScoutWeather
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import NetworkCore

final class AppNetworkAuthDelegate: NetworkAuthDelegate {
    let key: String
    
    init() {
        /*
         At the very least the keys are not committed to source code. In a live app, I would recommend relying on a service from the backend or firebase remote config in order to obtain the api keys and store them in Keychain. Though, the keys are never truly secure as they must be retrieved and attached to network requests which means they can be sniffed out or can be detected at that point in time on the client side code.
         */
        
        guard
            let path = Bundle.main.path(forResource: "WeatherAPIConfig", ofType: "plist"),
            let data = FileManager.default.contents(atPath: path),
            let config = try? PropertyListDecoder().decode(WeatherAPIConfig.self, from: data)
        else {
            fatalError("WeatherAPIConfig.plist not found or corrupted. Review WeatherAPIConfig.swift to confirm parsing CodingKeys match the entries in the WeatherAPIConfig.plist.")
        }
        
        if config.apiKey.isEmpty {
            fatalError("The value for the key, API_KEY, is empty. Please obtain an API key from https://www.weatherapi.com and enter it into the WeatherAPIConfig.plist.")
        }
        
        key = config.apiKey
    }
    
    func authorizationToken() -> String {
        key
    }
}
