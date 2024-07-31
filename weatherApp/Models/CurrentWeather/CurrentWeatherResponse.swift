//
//  CurrentWeatherResponse.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

struct CurrentWeatherResponse: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int

    struct Coord: Codable, Equatable {
        let lon: Double
        let lat: Double
        
        static func == (lhs: Coord, rhs: Coord) -> Bool {
            return lhs.lon == rhs.lon &&
                   lhs.lat == rhs.lat
        }
    }

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

    struct Main: Codable, Equatable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let humidity: Int
        
        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.temp == rhs.temp &&
                   lhs.feels_like == rhs.feels_like &&
                   lhs.temp_min == rhs.temp_min &&
                   lhs.temp_max == rhs.temp_max &&
                   lhs.pressure == rhs.pressure &&
                   lhs.humidity == rhs.humidity
        }
    }

    struct Wind: Codable, Equatable {
        let speed: Double
        let deg: Int

        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.speed == rhs.speed &&
                   lhs.deg == rhs.deg
        }
    }

    struct Clouds: Codable, Equatable {
        let all: Int
        
        static func == (lhs: Clouds, rhs: Clouds) -> Bool {
            return lhs.all == rhs.all
        }
    }
    
    struct Sys: Codable, Equatable {
        let type: Int?
        let id: Int?
        let country: String
        let sunrise: Int
        let sunset: Int
        
        static func == (lhs: Sys, rhs: Sys) -> Bool {
            return lhs.type == rhs.type &&
                   lhs.id == rhs.id &&
                   lhs.country == rhs.country &&
                   lhs.sunrise == rhs.sunrise &&
                   lhs.sunset == rhs.sunset
        }
    }
}

extension CurrentWeatherResponse:  Equatable {
    static func == (lhs: CurrentWeatherResponse, rhs: CurrentWeatherResponse) -> Bool {
        return lhs.coord == rhs.coord &&
               lhs.weather == rhs.weather &&
               lhs.base == rhs.base &&
               lhs.main == rhs.main &&
               lhs.visibility == rhs.visibility &&
               lhs.wind == rhs.wind &&
               lhs.clouds == rhs.clouds &&
               lhs.dt == rhs.dt &&
               lhs.sys == rhs.sys &&
               lhs.timezone == rhs.timezone &&
               lhs.id == rhs.id &&
               lhs.name == rhs.name &&
               lhs.cod == rhs.cod
    }
}












