//
//  WeatherView.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = AppConfigurator.configure()

    var body: some View {
        VStack {
            if let currentWeather = viewModel.currentWeather {
                VStack {
                    Text(currentWeather.name)
                        .font(.largeTitle)
                        .padding()

                    Image(systemName: currentWeather.weather.first?.id.weatherIcon ?? "questionmark" )
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()

                    Text("\(Int(currentWeather.main.temp))°C")
                        .font(.largeTitle)
                        .bold()

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Humidity: \(currentWeather.main.humidity)%")
                            Text("Pressure: \(currentWeather.main.pressure) hPa")
                            Text("Wind Speed: \(String(format: "%.2f", currentWeather.wind.speed)) m/s")

                        }
                    }
                    .padding()
                }
            }

            if !viewModel.forecastDays.isEmpty {
                Text("5-Day Forecast")
                    .font(.title2)
                    .padding()

                ForecastView(forecastDays: viewModel.forecastDays)
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                ProgressView("Loading...")
            }
        }
        .onAppear {
            viewModel.requestLocation()
        }
    }
}

