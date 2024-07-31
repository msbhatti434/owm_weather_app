//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var currentWeather: CurrentWeatherResponse?
    @Published var forecastDays: [ForecastDay] = []
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

                DispatchQueue.main.async {
                    self.currentWeather = currentWeather

                    let today = Calendar.current.startOfDay(for: Date())
                    var uniqueForecastDays: [String: ForecastDay] = [:]

                    for forecast in forecastResponse.list {
                        let forecastDate = Date(timeIntervalSince1970: TimeInterval(forecast.dt))
                        let forecastDay = Calendar.current.startOfDay(for: forecastDate)

                        if forecastDay > today {
                            let dayInitials = DateFormatter.localizedString(from: forecastDate, dateStyle: .short, timeStyle: .none)

                            if uniqueForecastDays[dayInitials] == nil {
                                let forecastDay = ForecastDay(date: forecastDate,
                                                              temperature: forecast.main.temp,
                                                              weatherDescription: forecast.weather.first?.description ?? "",
                                                              conditionCode: forecast.weather.first?.id ?? 0)
                                uniqueForecastDays[dayInitials] = forecastDay
                            }
                        }
                    }

                    self.forecastDays = uniqueForecastDays.values
                        .sorted(by: { $0.date < $1.date })
                        .prefix(5) // Ensures only 5 days are displayed
                        .map { $0 }
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
