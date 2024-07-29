//
//  LocationService.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import CoreLocation
final class LocationService: NSObject {
    private let locationManager = CLLocationManager()
    private var locationCompletion: ((Result<CLLocation, Error>) -> Void)?

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation(completion: @escaping (Result<CLLocation, Error>) -> Void) {
        locationCompletion = completion
        checkLocationAuthorizationStatus()
    }

    private func checkLocationAuthorizationStatus() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            locationCompletion?(.failure(LocationError.permissionDenied))
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        @unknown default:
            print("Unknown authorization status")
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationCompletion?(.success(location))
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationCompletion?(.failure(error))
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorizationStatus()
    }
}

enum LocationError: Error {
    case permissionDenied
}

//31.5204° N, 74.3587° E Lahore
