//
//  AlertViewState.swift
//  SharedUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI

public struct AlertViewState {
    public struct Action: Identifiable {
        public let title: String
        public let role: ButtonRole
        public let perform: () -> Void
        
        public init(
            title: String,
            role: ButtonRole,
            perform: @escaping () -> Void
        ) {
            self.title = title
            self.role = role
            self.perform = perform
        }
        
        public var id: String {
            title
        }
    }
    
    public let title: String
    public let message: String
    public let actions: [Action]
    
    public init(
        title: String,
        message: String,
        actions: [Action]
    ) {
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    public static func error(_ error: Error, retry: @escaping () -> Void) -> AlertViewState {
        var message = error.localizedDescription
        if let localizedError = error as? LocalizedError, let errorDescription = localizedError.errorDescription {
            message = errorDescription
            if let recoverySuggestion = localizedError.recoverySuggestion {
                message += " \(recoverySuggestion)"
            }
        }
        
        return AlertViewState(
            title: "Error",
            message: message,
            actions: [
                AlertViewState.Action(
                    title: "Retry",
                    role: .cancel,
                    perform: {
                        retry()
                    })
            ])
    }
}
