//
//  Int.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 31/07/2024.
//

import Foundation

extension Int {
    
    var weatherIcon: String {
        switch self {
        case 200...232:
            return "cloud.bolt.rain.fill"
        case 300...321:
            return "cloud.drizzle.fill"
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
        case 800:
            return "sun.max.fill"
        case 801...804:
            return "cloud.fill"
        default:
            return "questionmark"
        }
    }
}
