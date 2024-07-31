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
        NavigationView {
            VStack {
                if let weather = viewModel.currentWeather {
                    VStack(alignment: .center, spacing: 16) {
                        Image(systemName: weather.weather.first?.id.weatherIcon ?? "questionmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)

                        Text(weather.name)
                            .font(.title)
                            .bold()

                        Text(String(format: "%.1f°C", weather.main.temp))
                                               .font(.system(size: 64))

                        VStack(alignment: .leading) {
                            HStack(spacing: 40) {
                                WeatherDetailView(label: "Humidity", value: "\(weather.main.humidity)%")
                                WeatherDetailView(label: "Wind Speed", value: "\(String(format: "%.2f", weather.wind.speed)) m/s")
                            }
                        }
                        .padding()

                        // Forecast View
                        ForecastView(forecastDays: viewModel.forecastDays)
                            .padding()
                    }
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                } else {
                    Text("Loading...")
                }
            }
            .navigationTitle("Weather")
            .onAppear {
                viewModel.requestLocation()
            }
        }
    }
}
