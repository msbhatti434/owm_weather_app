//
//  WeatherServiceProtocol.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation
import CoreLocation

protocol WeatherServiceProtocol {
    func fetchWeather(for location: CLLocation) async throws -> WeatherResponse
}
