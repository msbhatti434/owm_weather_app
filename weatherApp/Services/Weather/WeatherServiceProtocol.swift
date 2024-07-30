//
//  WeatherServiceProtocol.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation
import CoreLocation

import Foundation
import CoreLocation

protocol WeatherServiceProtocol {
    func fetchCurrentWeather(latitude: Double, longitude: Double, units: Unit) async throws -> CurrentWeatherResponse
    func fetchForecast(latitude: Double, longitude: Double, units: Unit) async throws -> ForecastResponse
}
