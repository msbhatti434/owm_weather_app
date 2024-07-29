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

    private let locationService = LocationService()
    
    func requestLocation() {
        locationService.requestLocation { [weak self] result in
            switch result {
            case .success(let location):
                self?.latitude = location.coordinate.latitude
                self?.longitude = location.coordinate.longitude
                print("User's location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            case .failure(let error):
                self?.handleLocationError(error)
            }
        }
    }

    private func handleLocationError(_ error: Error) {
        if let locationError = error as? LocationError, locationError == .permissionDenied {
            self.locationError = "Location permission denied."
        } else {
            locationError = error.localizedDescription
        }
        print("Failed to get user's location: \(locationError ?? "Unknown error")")
    }
}
