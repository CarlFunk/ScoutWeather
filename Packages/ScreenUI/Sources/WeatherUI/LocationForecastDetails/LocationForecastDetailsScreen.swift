//
//  LocationForecastDetailsScreen.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import SwiftUI

public struct LocationForecastDetailsScreen: View {
    @State var viewModel: LocationForecastDetailsViewModel
    
    public init(viewModel: LocationForecastDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LocationForecastHeaderView(viewState: viewModel.viewState.header)
                .padding()
            
            LocationForecastRangeView(viewState: viewModel.viewState.range)
                .padding()
            
            LocationForecastStatsView(viewState: viewModel.viewState.stats)
                .padding()
        }
        .navigationTitle(viewModel.viewState.title)
        .onAppear {
            viewModel.viewAppeared()
        }
    }
}

#Preview {
    LocationForecastDetailsScreen(viewModel: LocationForecastDetailsViewModel(location: .mock(), forecastDay: .mock()))
}
