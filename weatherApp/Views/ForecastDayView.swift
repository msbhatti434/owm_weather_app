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
                .font(.headline)
                .bold()
            
            Image(systemName: forecastDay.conditionCode.weatherIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text(String(format: "%.1f°C", forecastDay.temperature))
                            .font(.title)
                            .fontWeight(.bold)
            
            Text(forecastDay.weatherDescription)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
    }
}



struct ForecastDayView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDayView(forecastDay: ForecastDay(date: Date(), temperature: 20, weatherDescription: "Clear", conditionCode: 800))
    }
}
