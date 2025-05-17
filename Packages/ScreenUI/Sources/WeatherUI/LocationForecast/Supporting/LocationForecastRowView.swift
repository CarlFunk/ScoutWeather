//
//  LocationForecastRowView.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI

struct LocationForecastRowView: View {
    enum Action {
        case tapped
    }
    
    let viewState: LocationForecastRowViewState
    let action: (Action) -> Void
    
    var body: some View {
        HStack(spacing: .zero) {
            ConditionIconView(url: viewState.conditionIcon, size: CGSize(width: 48, height: 48))
                .padding(.trailing, 16)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewState.date)
                    .font(.headline.weight(.bold))
                    .foregroundStyle(.primary)
                
                Text(viewState.conditionText)
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
            .padding(.trailing, 16)
            
            Spacer()
            
            LocationForecastRangeView(
                viewState: viewState.range,
                font: .caption2)
                .frame(width: 160)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            action(.tapped)
        }
    }
}

#Preview {
    LocationForecastRowView(viewState: .mock(), action: { _ in })
}
