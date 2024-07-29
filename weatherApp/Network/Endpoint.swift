//
//  Endpoint.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

enum Endpoint {
    case currentWeather(latitude: Double, longitude: Double)
    case forecast(latitude: Double, longitude: Double)
    
    var path: String {
        switch self {
        case .currentWeather(let latitude, let longitude):
            return "weather?lat=\(latitude)&lon=\(longitude)&appid=\(AppConstants.apiKey)"
        case .forecast(let latitude, let longitude):
            return "forecast?lat=\(latitude)&lon=\(longitude)&appid=\(AppConstants.apiKey)"
        }
    }
}
