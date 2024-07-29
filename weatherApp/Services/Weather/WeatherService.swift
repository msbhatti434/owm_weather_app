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

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func fetchWeather(for location: CLLocation) async throws -> WeatherResponse {
        let urlString = "\(AppConfig.baseURL)/forecast?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(AppConfig.apiKey)"
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let weatherResponse: WeatherResponse = try await networkService.request(url: url, method: .get)
        return weatherResponse
    }
}
