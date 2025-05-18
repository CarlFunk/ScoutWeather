//
//  OptionMenuViewState+Mapping.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SettingsDomain

extension OptionMenuViewState.Option {
    init(from domainModel: TemperatureSetting) {
        self.init(
            id: domainModel.id,
            title: domainModel.displayTitle)
    }
}
