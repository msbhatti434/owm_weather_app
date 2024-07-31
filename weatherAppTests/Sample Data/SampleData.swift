//
//  SampleData.swift
//  weatherAppTests
//
//  Created by Saqlain Bhatti on 01/08/2024.
//

import Foundation

struct SampleData {
    static func currentWeatherResponse() -> CurrentWeatherResponse {
        return CurrentWeatherResponse(
            coord: CurrentWeatherResponse.Coord(lon: 0, lat: 0),
            weather: [CurrentWeatherResponse.Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")],
            base: "stations",
            main: CurrentWeatherResponse.Main(temp: 20, feels_like: 18, temp_min: 15, temp_max: 25, pressure: 1012, humidity: 60),
            visibility: 10000,
            wind: CurrentWeatherResponse.Wind(speed: 5, deg: 270),
            clouds: CurrentWeatherResponse.Clouds(all: 0),
            dt: 1625227200,
            sys: CurrentWeatherResponse.Sys(type: 1, id: 1234, country: "US", sunrise: 1625212800, sunset: 1625265600),
            timezone: -14400,
            id: 5128581,
            name: "New York",
            cod: 200
        )
    }

    static func forecastResponse() -> ForecastResponse {
        return ForecastResponse(
            cod: "200",
            message: 0,
            cnt: 1,
            list: [
                ForecastResponse.Forecast(
                    dt: 1625265600,
                    main: ForecastResponse.Forecast.Main(temp: 20, feels_like: 18, temp_min: 15, temp_max: 25, pressure: 1012, humidity: 60),
                    weather: [ForecastResponse.Forecast.Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")],
                    clouds: ForecastResponse.Forecast.Clouds(all: 0),
                    wind: ForecastResponse.Forecast.Wind(speed: 5, deg: 270),
                    visibility: 10000,
                    pop: 0,
                    sys: ForecastResponse.Forecast.Sys(pod: "d"),
                    dt_txt: "2021-07-02 12:00:00"
                )
            ],
            city: ForecastResponse.City(
                id: 5128581,
                name: "New York",
                coord: ForecastResponse.City.Coord(lat: 40.7128, lon: -74.0060),
                country: "US",
                population: 8175133,
                timezone: -14400,
                sunrise: 1625257085,
                sunset: 1625300055
            )
        )
    }


    static func sampleError() -> Error {
        return NSError(domain: "TestError", code: 0, userInfo: nil)
    }
}
