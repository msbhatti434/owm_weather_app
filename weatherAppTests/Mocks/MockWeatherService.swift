//
//  MockWeatherService.swift
//  weatherAppTests
//
//  Created by Saqlain Bhatti on 01/08/2024.
//

import Foundation

class MockWeatherService: WeatherServiceProtocol {
    var currentWeatherResponse: CurrentWeatherResponse?
    var forecastResponse: ForecastResponse?
    var error: Error?

    func fetchCurrentWeather(latitude: Double, longitude: Double, units: Unit) async throws -> CurrentWeatherResponse {
        if let error = error {
            throw error
        }
        return currentWeatherResponse!
    }

    func fetchForecast(latitude: Double, longitude: Double, units: Unit) async throws -> ForecastResponse {
        if let error = error {
            throw error
        }
        return forecastResponse!
    }
}
