//
//  AppConfig.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

struct AppConfig {
    static var apiKey: String {
        guard let filePath = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath),
              let key = plist.object(forKey: "OWM_API_KEY") as? String else {
            fatalError("Couldn't find key 'OWM_API_KEY' in 'Secrets.plist'.")
        }
        return key
    }

    static let baseURL = "https://api.openweathermap.org/data/2.5"
}

