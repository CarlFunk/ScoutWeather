//
//  BannerViewState.swift
//  SharedUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import AmpleMock
import Foundation

public struct BannerViewState: Mockable {
    
    public let title: String
    
    public init(
        title: String
    ) {
        self.title = title
    }
    
    public static func mock(values: MockValues<BannerViewState>) -> BannerViewState {
        BannerViewState(
            title: values.get(\.title, defaultValue: "This is a title.")
        )
    }
}
