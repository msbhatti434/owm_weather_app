//
//  Units.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 30/07/2024.
//

import Foundation

enum Unit: String {
    case standard
    case metric
    case imperial

    var queryParameter: String {
        return self.rawValue
    }
}
