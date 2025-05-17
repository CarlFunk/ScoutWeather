//
//  OptionMenu.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/16/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI

struct OptionMenu: View {
    enum Action {
        case tapped(id: String)
    }
    
    let viewState: OptionMenuViewState
    let action: (Action) -> Void
    
    var body: some View {
        Menu {
            ForEach(viewState.options) { option in
                Button(option.title) {
                    action(.tapped(id: option.id))
                }
            }
        } label: {
            Label(viewState.selected.title, systemImage: "arrowtriangle.down")
                .font(.caption)
        }
    }
}

#Preview {
    OptionMenu(
        viewState: .mock(),
        action: { _ in })
}
