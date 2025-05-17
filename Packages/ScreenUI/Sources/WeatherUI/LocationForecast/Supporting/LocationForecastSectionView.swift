//
//  LocationForecastSectionView.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI

struct LocationForecastSectionView: View {
    enum Action {
        case tappedForecast(id: String)
    }
    
    let viewState: LocationForecastSectionViewState
    let action: (Action) -> Void
    
    var body: some View {
        ForEach(viewState.rows) { rowViewState in
            LocationForecastRowView(viewState: rowViewState) { childAction in
                switch childAction {
                case .tapped:
                    action(.tappedForecast(id: rowViewState.id))
                }
            }
        }
    }
}

#Preview {
    LocationForecastSectionView(viewState: .mock(), action: { _ in })
}
