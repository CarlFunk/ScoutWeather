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
            if let bannerViewState = viewModel.viewState.bannerViewState {
                BannerView(viewState: bannerViewState) { action in
                    switch action {
                    case .dismiss:
                        viewModel.dismissBanner()
                    }
                }
                .padding()
                .transition(.move(edge: .top))
            }
            
            LocationForecastView(
                viewModel: viewModel.locationViewModel
            )
        }
        .animation(.bouncy, value: viewModel.viewState.bannerViewState != nil)
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
