//
//  MockDependencyPreview.swift
//  SharedUI
//
//  Created by Carl Funk on 5/12/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import SwiftUI

public struct MockDependencyPreview<Preview: View>: View {
    public let preview: () -> Preview
    
    public init(_ preview: @escaping () -> Preview) {
        MockDependency.setup()
        
        self.preview = preview
    }
    
    public var body: some View {
        preview()
    }
}
