//
//  LocationForecastViewModelTests.swift
//  WeatherUITests
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation
import Observation
import SettingsDomain
import SharedUI
import Testing
@testable import WeatherUI

struct LocationForecastViewModelTests {
    init() {
        MockDependency.setup()
    }
    
    @Test func testUpdateTemperatureSettingUpdatesDomainModel() async throws {
        let viewModel = LocationForecastViewModel()
        viewModel.viewAppeared()
        
        #expect(viewModel.settings.temperature == .fahrenheit)
        
        await withCheckedContinuation { continuation in
            withObservationTracking {
                _ = viewModel.settings
            } onChange: {
                DispatchQueue.main.async {
                    continuation.resume()
                }
            }
            
            viewModel.updateTemperatureSetting(id: TemperatureSetting.celsius.id)
        }
        
        #expect(viewModel.settings.temperature == .celsius)
    }
    
    @Test func testUpdateTemperatureSettingUpdatesOptionViewState() async throws {
        let fahrenheitSelection = OptionMenuViewState.Option(
            id: TemperatureSetting.fahrenheit.id,
            title: TemperatureSetting.fahrenheit.displayTitle)
        let celsiusSelection = OptionMenuViewState.Option(
            id: TemperatureSetting.celsius.id,
            title: TemperatureSetting.celsius.displayTitle)
        
        let viewModel = LocationForecastViewModel()
        viewModel.viewAppeared()
        
        #expect(viewModel.viewState.temperatureSetting.selected == fahrenheitSelection)
        
        await withCheckedContinuation { continuation in
            withObservationTracking {
                _ = viewModel.viewState
            } onChange: {
                DispatchQueue.main.async {
                    continuation.resume()
                }
            }
            
            viewModel.updateTemperatureSetting(id: TemperatureSetting.celsius.id)
        }
        
        #expect(viewModel.viewState.temperatureSetting.selected == celsiusSelection)
    }
    
    @Test func testUpdateTemperatureSettingUpdatesMultiDayForecast() async throws {
        let viewModel = LocationForecastViewModel()
        viewModel.viewAppeared()
        
        guard let originalFirstForecastRowViewState = viewModel.viewState.multiDayForecast.rows.first else {
            Issue.record("Expected forecast rows to exist in view state")
            return
        }
        
        #expect(originalFirstForecastRowViewState.range.average == "88°F")
        
        await withCheckedContinuation { continuation in
            withObservationTracking {
                _ = viewModel.viewState
            } onChange: {
                DispatchQueue.main.async {
                    continuation.resume()
                }
            }
            
            viewModel.updateTemperatureSetting(id: TemperatureSetting.celsius.id)
        }
        
        guard let updatedFirstForecastRowViewState = viewModel.viewState.multiDayForecast.rows.first else {
            Issue.record("Expected forecast rows to exist in view state")
            return
        }
        
        #expect(updatedFirstForecastRowViewState.range.average == "31°C")
    }
}
