//
//  ForecastDayView.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 31/07/2024.
//

import SwiftUI

struct ForecastDayView: View {
    let forecastDay: ForecastDay

    var body: some View {
        VStack {
            Text(forecastDay.dayInitials)
            Image(systemName: forecastDay.conditionCode.weatherIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            Text("\(Int(forecastDay.temperature))°")
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}



struct ForecastDayView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDayView(forecastDay: ForecastDay(date: Date(), temperature: 20, weatherDescription: "Clear", conditionCode: 800))
    }
}
