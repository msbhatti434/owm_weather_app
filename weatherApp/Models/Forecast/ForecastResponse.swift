//
//  ForecastResponse.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 30/07/2024.
//

import Foundation

struct ForecastResponse: Codable, Equatable {
    let cod: String
    let message: Int
    let cnt: Int
    let list: [Forecast]
    let city: City

    static func == (lhs: ForecastResponse, rhs: ForecastResponse) -> Bool {
        return lhs.cod == rhs.cod &&
               lhs.message == rhs.message &&
               lhs.cnt == rhs.cnt &&
               lhs.list == rhs.list &&
               lhs.city == rhs.city
    }

    // MARK: - Forecast

    struct Forecast: Codable, Equatable {
        let dt: Int
        let main: Main
        let weather: [Weather]
        let clouds: Clouds
        let wind: Wind
        let visibility: Int
        let pop: Double
        let sys: Sys
        let dt_txt: String

        static func == (lhs: Forecast, rhs: Forecast) -> Bool {
            return lhs.dt == rhs.dt &&
                   lhs.main == rhs.main &&
                   lhs.weather == rhs.weather &&
                   lhs.clouds == rhs.clouds &&
                   lhs.wind == rhs.wind &&
                   lhs.visibility == rhs.visibility &&
                   lhs.pop == rhs.pop &&
                   lhs.sys == rhs.sys &&
                   lhs.dt_txt == rhs.dt_txt
        }

        // MARK: - Main

        struct Main: Codable, Equatable {
            let temp: Double
            let feels_like: Double
            let temp_min: Double
            let temp_max: Double
            let pressure: Int
            let humidity: Int

            static func == (lhs: Main, rhs: Main) -> Bool {
                return lhs.temp == rhs.temp &&
                       lhs.feels_like == rhs.feels_like &&
                       lhs.temp_min == rhs.temp_min &&
                       lhs.temp_max == rhs.temp_max &&
                       lhs.pressure == rhs.pressure &&
                       lhs.humidity == rhs.humidity
            }
        }

        // MARK: - Weather

        struct Weather: Codable, Equatable {
            let id: Int
            let main: String
            let description: String
            let icon: String

            static func == (lhs: Weather, rhs: Weather) -> Bool {
                return lhs.id == rhs.id &&
                       lhs.main == rhs.main &&
                       lhs.description == rhs.description &&
                       lhs.icon == rhs.icon
            }
        }

        // MARK: - Clouds

        struct Clouds: Codable, Equatable {
            let all: Int

            static func == (lhs: Clouds, rhs: Clouds) -> Bool {
                return lhs.all == rhs.all
            }
        }

        // MARK: - Wind

        struct Wind: Codable, Equatable {
            let speed: Double
            let deg: Int

            static func == (lhs: Wind, rhs: Wind) -> Bool {
                return lhs.speed == rhs.speed &&
                       lhs.deg == rhs.deg
            }
        }

        // MARK: - Sys

        struct Sys: Codable, Equatable {
            let pod: String

            static func == (lhs: Sys, rhs: Sys) -> Bool {
                return lhs.pod == rhs.pod
            }
        }
    }

    // MARK: - City

    struct City: Codable, Equatable {
        let id: Int
        let name: String
        let coord: Coord
        let country: String
        let population: Int
        let timezone: Int
        let sunrise: Int
        let sunset: Int

        static func == (lhs: City, rhs: City) -> Bool {
            return lhs.id == rhs.id &&
                   lhs.name == rhs.name &&
                   lhs.coord == rhs.coord &&
                   lhs.country == rhs.country &&
                   lhs.population == rhs.population &&
                   lhs.timezone == rhs.timezone &&
                   lhs.sunrise == rhs.sunrise &&
                   lhs.sunset == rhs.sunset
        }

        // MARK: - Coord

        struct Coord: Codable, Equatable {
            let lat: Double
            let lon: Double

            static func == (lhs: Coord, rhs: Coord) -> Bool {
                return lhs.lat == rhs.lat &&
                       lhs.lon == rhs.lon
            }
        }
    }
}
