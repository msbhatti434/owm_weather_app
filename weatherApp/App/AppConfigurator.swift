//
//  AppConfigurator.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 31/07/2024.
//

import Foundation

class AppConfigurator {
    static func configure() -> WeatherViewModel {
        let networkService = NetworkService()
        let weatherService = WeatherService(networkService: networkService, apiKey: AppConfig.apiKey)
        let locationService = LocationService()
        return WeatherViewModel(weatherService: weatherService, locationService: locationService)
    }
}

