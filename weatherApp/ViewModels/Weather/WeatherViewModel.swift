//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var currentWeather: CurrentWeatherResponse?
    @Published var forecast: [ForecastDay] = []
    @Published var errorMessage: String?
    @Published var latitude: Double?
    @Published var longitude: Double?

    private let weatherService: WeatherServiceProtocol
    private let locationService: LocationServiceProtocol
    private let units: Unit

    init(weatherService: WeatherServiceProtocol, locationService: LocationServiceProtocol, units: Unit = .metric) {
        self.weatherService = weatherService
        self.locationService = locationService
        self.units = units

        requestLocation()
    }

    func requestLocation() {
        locationService.requestLocation { [weak self] result in
            switch result {
            case .success(let location):
                self?.latitude = location.coordinate.latitude
                self?.longitude = location.coordinate.longitude
                self?.fetchWeatherData()
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }

    func fetchWeatherData() {
        guard let latitude = latitude, let longitude = longitude else {
            return
        }

        Task {
            do {
                let currentWeather = try await weatherService.fetchCurrentWeather(latitude: latitude, longitude: longitude, units: units)
                let forecastResponse = try await weatherService.fetchForecast(latitude: latitude, longitude: longitude, units: units)
                let forecast = forecastResponse.list.map { ForecastDay(date: Date(timeIntervalSince1970: TimeInterval($0.dt)),
                                                                       temperature: $0.main.temp,
                                                                       weatherDescription: $0.weather.first?.description ?? "",
                                                                       icon: $0.weather.first?.icon ?? "") }
                DispatchQueue.main.async {
                    self.currentWeather = currentWeather
                    self.forecast = forecast
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

