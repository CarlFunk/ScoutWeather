//
//  LocationForecastView.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SharedUI
import SwiftUI

public struct LocationForecastView: View {
    @State var viewModel: LocationForecastViewModel
    
    public init(viewModel: LocationForecastViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LocationForecastHeaderView(
                viewState: viewModel.viewState.header
            )
            .padding()
            
            OptionMenu(
                viewState: viewModel.viewState.temperatureSetting
            ) { action in
                switch action {
                case .tapped(let id):
                    viewModel.updateTemperatureSetting(id: id)
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal)
            
            LocationForecastSectionView(
                viewState: viewModel.viewState.multiDayForecast
            ) { action in
                switch action {
                case .tappedForecast(let id):
                    viewModel.viewForecast(id: id)
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.viewAppeared()
        }
    }
}

#Preview {
    MockDependencyPreview {
        LocationForecastView(
            viewModel: LocationForecastViewModel())
    }
}
