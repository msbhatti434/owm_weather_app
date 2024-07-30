//
//  ForecastResponse.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 30/07/2024.
//

import Foundation

struct ForecastResponse: Codable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [Forecast]
    let city: City

    struct Forecast: Codable {
        let dt: Int
        let main: Main
        let weather: [Weather]
        let clouds: Clouds
        let wind: Wind
        let visibility: Int
        let pop: Double
        let sys: Sys
        let dt_txt: String

        struct Main: Codable {
            let temp: Double
            let feels_like: Double
            let temp_min: Double
            let temp_max: Double
            let pressure: Int
            let humidity: Int
        }

        struct Weather: Codable {
            let id: Int
            let main: String
            let description: String
            let icon: String
        }

        struct Clouds: Codable {
            let all: Int
        }

        struct Wind: Codable {
            let speed: Double
            let deg: Int
        }

        struct Sys: Codable {
            let pod: String
        }
    }

    struct City: Codable {
        let id: Int
        let name: String
        let coord: Coord
        let country: String
        let population: Int
        let timezone: Int
        let sunrise: Int
        let sunset: Int

        struct Coord: Codable {
            let lat: Double
            let lon: Double
        }
    }
}
