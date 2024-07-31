//
//  WeatherServiceTests.swift
//  weatherAppTests
//
//  Created by Saqlain Bhatti on 01/08/2024.
//

import XCTest
@testable import weatherApp

class WeatherServiceTests: XCTestCase {
    var weatherService: MockWeatherService!

    override func setUp() {
        super.setUp()
        weatherService = MockWeatherService()
    }

    override func tearDown() {
        weatherService = nil
        super.tearDown()
    }

    func testFetchCurrentWeatherSuccess() async {
        // Given
        let expectedResponse = SampleData.currentWeatherResponse()
        weatherService.currentWeatherResponse = expectedResponse

        // When
        let result = try? await weatherService.fetchCurrentWeather(latitude: 0, longitude: 0, units: .metric)

        // Then
        XCTAssertEqual(result, expectedResponse)
    }

    func testFetchCurrentWeatherFailure() async {
        // Given
        let expectedError = SampleData.sampleError()
        weatherService.error = expectedError

        // When
        let result = try? await weatherService.fetchCurrentWeather(latitude: 0, longitude: 0, units: .metric)

        // Then
        XCTAssertNil(result)
    }

    func testFetchForecastSuccess() async {
        // Given
        let expectedForecastResponse = SampleData.forecastResponse()
        weatherService.forecastResponse = expectedForecastResponse

        // When
        let result = try? await weatherService.fetchForecast(latitude: 0, longitude: 0, units: .metric)

        // Then
        XCTAssertEqual(result, expectedForecastResponse)
    }

    func testFetchForecastFailure() async {
        // Given
        let expectedError = SampleData.sampleError()
        weatherService.error = expectedError

        // When
        let result = try? await weatherService.fetchForecast(latitude: 0, longitude: 0, units: .metric)

        // Then
        XCTAssertNil(result)
    }
}

