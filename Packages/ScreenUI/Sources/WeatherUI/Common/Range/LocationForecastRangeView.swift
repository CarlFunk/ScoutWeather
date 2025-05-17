//
//  LocationForecastRangeView.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI

struct LocationForecastRangeView: View {
    let viewState: LocationForecastRangeViewState
    let font: Font
    
    init(
        viewState: LocationForecastRangeViewState,
        font: Font = .callout
    ) {
        self.viewState = viewState
        self.font = font
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            label(text: viewState.min, color: .blue)
            divider
            label(text: viewState.min, color: .primary)
            divider
            label(text: viewState.max, color: .orange)
        }
    }
    
    private var divider: some View {
        Rectangle()
            .fill(.tertiary)
            .frame(height: 1)
    }
    
    private func label(text: String, color: Color) -> some View {
        Text(text)
            .font(font.weight(.bold))
            .foregroundStyle(color)
            .fixedSize()
    }
}

#Preview {
    LocationForecastRangeView(viewState: .mock())
}
