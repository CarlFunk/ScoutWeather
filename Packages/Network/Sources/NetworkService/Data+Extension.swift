//
//  Data+Extension.swift
//  NetworkService
//
//  Created by Carl Funk on 5/17/25.
//  Copyright © 2025 Carl Funk. All rights reserved.
//

import Foundation

extension Data {
    func prettyPrinted() -> String? {
        do {
            let object = try JSONSerialization.jsonObject(with: self, options: [])
            let data = try JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted])
            return String(data: data, encoding: .utf8)
        } catch {
            return String(data: self, encoding: .utf8)
        }
    }
}
