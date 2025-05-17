//
//  ConditionIconView.swift
//  WeatherUI
//
//  Created by Carl Funk on 5/14/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import NukeUI
import SwiftUI

struct ConditionIconView: View {
    let url: URL?
    let size: CGSize
    
    var body: some View {
        LazyImage(url: url) { state in
            if let _ = state.error {
                ProgressView()
                    .frame(width: size.width, height: size.height)
            } else if let image = state.image {
                image
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.width, height: size.height)
            } else {
                ProgressView()
                    .frame(width: size.width, height: size.height)
            }
        }
    }
}

#Preview {
    ConditionIconView(url: URL.mockImage, size: CGSize(width: 48, height: 48))
}
