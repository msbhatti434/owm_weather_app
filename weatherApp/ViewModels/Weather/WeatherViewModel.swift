//
//  WeatherViewModel.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation
import CoreLocation

final class WeatherViewModel: ObservableObject {
    @Published var latitude: Double?
    @Published var longitude: Double?
    @Published var locationError: String?
    @Published var weather: WeatherResponse?
    @Published var weatherError: String?

    private let locationService: LocationServiceProtocol
    private let weatherService: WeatherServiceProtocol

    init(locationService: LocationServiceProtocol = LocationService(),
         weatherService: WeatherServiceProtocol = WeatherService()) {
        self.locationService = locationService
        self.weatherService = weatherService
    }
    
    func requestLocation() {
        locationService.requestLocation { [weak self] result in
            switch result {
            case .success(let location):
                self?.latitude = location.coordinate.latitude
                self?.longitude = location.coordinate.longitude
                self?.fetchWeather(for: location)
            case .failure(let error):
                self?.handleLocationError(error)
            }
        }
    }

    private func handleLocationError(_ error: Error) {
        if let locationError = error as? LocationError, locationError == .permissionDenied {
            self.locationError = "Location permission denied."
        } else {
            self.locationError = error.localizedDescription
        }
        print("Failed to get user's location: \(self.locationError ?? "Unknown error")")
    }

    private func fetchWeather(for location: CLLocation) {
        Task {
            do {
                let weather = try await weatherService.fetchWeather(for: location)
                DispatchQueue.main.async {
                    self.weather = weather
                }
            } catch {
                DispatchQueue.main.async {
                    self.weatherError = error.localizedDescription
                }
                print("Failed to fetch weather data: \(error.localizedDescription)")
            }
        }
    }
}
