//
//  NetworkError.swift
//  NetworkCore
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

public enum NetworkError: LocalizedError {
    case connectivity
    case invalidRequest
    case invalidResponse
    case malformedBaseURL
    case rateLimited
    case restricted
    case unauthorized
    case unknown
    
    public var errorDescription: String? {
        switch self {
        case .connectivity:
            "The app is having trouble connecting to the internet."
        case .invalidRequest:
            "The request is invalid."
        case .invalidResponse:
            "An unexpected response was received."
        case .malformedBaseURL:
            "Unable to load resource due to URL."
        case .rateLimited:
            "There are too many requests from this device."
        case .restricted:
            "Invalid permissions to access the resource."
        case .unauthorized:
            "Missing credentials to access the resource."
        case .unknown:
            "Something went wrong."
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .connectivity:
            "Check the device's internet connection and try again."
        case .invalidRequest:
            "Please try again."
        case .invalidResponse:
            "Please try again."
        case .malformedBaseURL:
            "Please reach out to customer support to report this issue."
        case .rateLimited:
            "Please try again in a few minutes."
        case .restricted:
            "Please reach out to customer support to report this issue."
        case .unauthorized:
            "Please reach out to customer support to report this issue."
        case .unknown:
            "Please try again. If the issue persists, please reach out to customer support to report this issue."
        }
    }
}
