//
//  UserDefaultsService.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 01/08/2024.
//

import Foundation
import CoreLocation

final class UserDefaultsService {
    private let userDefaults = UserDefaults.standard

    // Save location data
    func saveLocation(latitude: Double, longitude: Double) {
        userDefaults.set(latitude, forKey: UserDefaultsKeys.latitude)
        userDefaults.set(longitude, forKey: UserDefaultsKeys.longitude)
    }

    // Retrieve location data
    func getLocation() -> CLLocation? {
        guard let latitude = userDefaults.value(forKey: UserDefaultsKeys.latitude) as? Double,
              let longitude = userDefaults.value(forKey: UserDefaultsKeys.longitude) as? Double else {
            return nil
        }
        return CLLocation(latitude: latitude, longitude: longitude)
    }

    // Clear location data
    func clearLocation() {
        userDefaults.removeObject(forKey: UserDefaultsKeys.latitude)
        userDefaults.removeObject(forKey: UserDefaultsKeys.longitude)
    }
}
