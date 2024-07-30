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
    let icon: String

    var dayOfWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
}
