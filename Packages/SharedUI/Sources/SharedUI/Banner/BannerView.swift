//
//  BannerView.swift
//  SharedUI
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI

public struct BannerView: View {
    public enum Action {
        case dismiss
    }
    
    public let viewState: BannerViewState
    public let action: (Action) -> Void
    
    public init(
        viewState: BannerViewState,
        action: @escaping (Action) -> Void
    ) {
        self.viewState = viewState
        self.action = action
    }
    
    public var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 16) {
            Text(viewState.title)
                .font(.callout.weight(.medium))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
            
            Button {
                action(.dismiss)
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                    .foregroundStyle(Color.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.blue)
        }
    }
}

#Preview {
    BannerView(viewState: .mock(), action: { _ in })
}
