//
//  Alert+AlertViewState.swift
//  SharedUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
    func alert(viewState: Binding<AlertViewState?>) -> some View {
        self
            .alert(
                viewState.wrappedValue?.title ?? "",
                isPresented: Binding(
                    get: {
                        return viewState.wrappedValue != nil
                    },
                    set: { newValue in
                        if newValue == false {
                            viewState.wrappedValue = nil
                        }
                    }),
                actions: {
                    if let actions = viewState.wrappedValue?.actions {
                        ForEach(actions) { action in
                            Button(action.title, role: action.role) {
                                action.perform()
                            }
                        }
                    }
                },
                message: {
                    Text(viewState.wrappedValue?.message ?? "")
                })
    }
}
