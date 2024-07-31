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

    func saveLocation(latitude: Double, longitude: Double) {
        clearData()
        userDefaults.set(latitude, forKey: UserDefaultsKeys.latitude)
        userDefaults.set(longitude, forKey: UserDefaultsKeys.longitude)
        self.logSaveOperation()
    }

    func getLocation() -> CLLocation? {
        guard let latitude = userDefaults.value(forKey: UserDefaultsKeys.latitude) as? Double,
              let longitude = userDefaults.value(forKey: UserDefaultsKeys.longitude) as? Double else {
            return nil
        }
        return CLLocation(latitude: latitude, longitude: longitude)
    }

    
    
    func saveWeatherData(_ weatherData: CurrentWeatherResponse) {
        if let encoded = try? JSONEncoder().encode(weatherData) {
            userDefaults.set(encoded, forKey: UserDefaultsKeys.lastWeatherData)
        }
    }
    
    func getWeatherData() -> CurrentWeatherResponse? {
        guard let data = userDefaults.data(forKey: UserDefaultsKeys.lastWeatherData),
              let weatherData = try? JSONDecoder().decode(CurrentWeatherResponse.self, from: data) else {
            return nil
        }
        return weatherData
    }
    
    func clearData() {
        userDefaults.removeObject(forKey: UserDefaultsKeys.latitude)
        userDefaults.removeObject(forKey: UserDefaultsKeys.longitude)
        userDefaults.removeObject(forKey: UserDefaultsKeys.lastWeatherData)
    }
    
    func logSaveOperation(){
        guard let latitude = userDefaults.value(forKey: UserDefaultsKeys.latitude) as? Double,
              let longitude = userDefaults.value(forKey: UserDefaultsKeys.longitude) as? Double else {
            print("No location Found")
            return
        }
    }
}
