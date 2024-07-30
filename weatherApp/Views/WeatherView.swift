//
//  WeatherView.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel

    var body: some View {
        VStack {
            if let currentWeather = viewModel.currentWeather {
                VStack {
                    Image(systemName: "cloud.sun.fill") // Placeholder for weather icon
                        .resizable()
                        .frame(width: 100, height: 100)
                    Text(currentWeather.name)
                        .font(.largeTitle)
                    Text("\(currentWeather.main.temp)°C")
                        .font(.title)
                }
                .padding()

                HStack {
                    Text("Humidity: \(currentWeather.main.humidity)%")
//                    Text("Rain: \(currentWeather.rain?.the1H ?? 0)%")
                }
                .padding()

                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.forecast) { day in
                            VStack {
                                Text(day.dayOfWeek)
                                Image(systemName: "cloud.fill") // Placeholder for weather icon
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                Text("\(day.temperature)°C")
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                }
            } else {
                Text("Fetching weather data...")
            }
        }
        .onAppear {
            viewModel.requestLocation()
        }
    }
}
