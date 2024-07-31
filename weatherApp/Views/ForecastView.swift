//
//  ForecastDayView.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 31/07/2024.
//

import SwiftUI

struct ForecastView: View {
    let forecastDays: [ForecastDay]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(forecastDays) { day in
                    ForecastDayView(forecastDay: day)
                }
            }
        }
        .frame(height: 150)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(forecastDays: [
            ForecastDay(date: Date(), temperature: 20, weatherDescription: "Clear", conditionCode: 800),
            ForecastDay(date: Date().addingTimeInterval(86400), temperature: 18, weatherDescription: "Rain", conditionCode: 500)
        ])
    }
}
