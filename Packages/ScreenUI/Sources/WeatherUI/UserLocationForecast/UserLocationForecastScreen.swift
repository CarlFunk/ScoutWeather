//
//  UserLocationForecastScreen.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/15/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SharedUI
import SwiftUI

public struct UserLocationForecastScreen: View {
    @State var viewModel: UserLocationForecastViewModel
    
    public init(viewModel: UserLocationForecastViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            switch viewModel.viewState {
            case .error:
                Text("ERROR")
            case .loading:
                ProgressView()
            case .defaultLocationForecast(let location, let coordinator), .locationForecast(let location, let coordinator):
                LocationForecastView(
                    viewModel: LocationForecastViewModel(
                        location: location,
                        coordinator: coordinator)
                )
                .id(location)
            }
        }
        .onAppear {
            viewModel.viewAppeared()
        }
    }
}

#Preview {
    MockDependencyPreview {
        UserLocationForecastScreen(viewModel: UserLocationForecastViewModel())
    }
}
