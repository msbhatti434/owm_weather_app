//
//  ForecastDay.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 31/07/2024.
//

import Foundation

struct ForecastDay: Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Double
    let weatherDescription: String
    let conditionCode: Int

    var dayInitials: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE" // "EEE" gives three-letter day initials
        return dateFormatter.string(from: date)
    }
}
