//
//  LocationForecastStatsView.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI

struct LocationForecastStatsView: View {
    let viewState: LocationForecastStatsViewState
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.adaptive(minimum: 80))
            ]
        ) {
            ForEach(viewState.items) { itemViewState in
                item(for: itemViewState)
            }
        }
    }
    
    func item(for itemViewState: LocationForecastStatsViewState.ItemViewState) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: itemViewState.systemImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12, height: 12)
                .foregroundStyle(Color.blue)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(itemViewState.title)
                    .font(.callout)
                    .foregroundStyle(.primary)
                
                Text(itemViewState.value)
                    .font(.callout.weight(.bold))
                    .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    LocationForecastStatsView(viewState: .mock())
}
