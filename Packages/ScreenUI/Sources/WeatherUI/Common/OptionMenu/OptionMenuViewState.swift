//
//  OptionMenuViewState.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/16/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation
import SettingsDomain

struct OptionMenuViewState: Mockable {
    struct Option: Equatable, Identifiable, Mockable {
        let id: String
        let title: String
        
        static func mock(values: MockValues<Option>) -> Option {
            Option(
                id: values.get(\.id, defaultValue: UUID().uuidString),
                title: values.get(\.title, defaultValue: "Title")
            )
        }
    }
    
    let options: [Option]
    let selected: Option
    
    static func mock(values: MockValues<OptionMenuViewState>) -> OptionMenuViewState {
        OptionMenuViewState(
            options: values.get(\.options, defaultValue: [.mock(), .mock(), .mock()]),
            selected: values.get(\.selected, defaultValue: .mock())
        )
    }
}

extension OptionMenuViewState.Option {
    init(from domainModel: TemperatureSetting) {
        self.init(
            id: domainModel.id,
            title: domainModel.displayTitle)
    }
}
