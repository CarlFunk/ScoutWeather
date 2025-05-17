//
//  LocationForecastHeaderView.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI
import WeatherDomain

struct LocationForecastHeaderView: View {
    let viewState: LocationForecastHeaderViewState
    
    public var body: some View {
        HStack(alignment: .top, spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                region
                name
                condition
                    .padding(.top, 8)
            }
            
            Spacer()
            
            icon
        }
    }
    
    private var name: some View {
        Text(viewState.name)
            .font(.largeTitle.weight(.medium))
            .foregroundStyle(.primary)
    }
    
    private var region: some View {
        Text(viewState.region)
            .font(.body.weight(.medium))
            .foregroundStyle(.secondary)
    }
    
    private var condition: some View {
        Text(viewState.condition)
            .font(.caption)
            .foregroundStyle(.primary)
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .background {
                Capsule()
                    .fill(.quaternary)
            }
    }
    
    private var icon: some View {
        ConditionIconView(
            url: viewState.conditionIcon,
            size: CGSize(width: 96, height: 96))
    }
}

#Preview {
    LocationForecastHeaderView(viewState: .mock())
}
