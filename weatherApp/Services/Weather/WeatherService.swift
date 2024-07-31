//
//  WeatherService.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation
import CoreLocation

struct WeatherService: WeatherServiceProtocol {
    private let networkService: NetworkServiceProtocol
    private let apiKey: String

    init(networkService: NetworkServiceProtocol, apiKey: String) {
        self.networkService = networkService
        self.apiKey = apiKey
    }

    func fetchCurrentWeather(latitude: Double, longitude: Double, units: Unit) async throws -> CurrentWeatherResponse {
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")!
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "units", value: units.queryParameter),
            URLQueryItem(name: "appid", value: apiKey)
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        return try await networkService.request(url: url, method: .get)
    }

    func fetchForecast(latitude: Double, longitude: Double, units: Unit) async throws -> ForecastResponse {
        var components = URLComponents(string: "https://api.openweathermap.org/data/2.5/forecast")!
        components.queryItems = [
            URLQueryItem(name: "lat", value: "\(latitude)"),
            URLQueryItem(name: "lon", value: "\(longitude)"),
            URLQueryItem(name: "units", value: units.queryParameter),
            URLQueryItem(name: "appid", value: apiKey)
        ]

        guard let url = components.url else {
            throw URLError(.badURL)
        }

        return try await networkService.request(url: url, method: .get)
    }
}
