//
//  LocationServiceTests.swift
//  weatherAppTests
//
//  Created by Saqlain Bhatti on 01/08/2024.
//

import XCTest
import CoreLocation
@testable import weatherApp

class LocationServiceTests: XCTestCase {
    var locationService: MockLocationService!

    override func setUp() {
        super.setUp()
        locationService = MockLocationService()
    }

    func testRequestLocationSuccess() {
        // Given
        let expectedLocation = CLLocation(latitude: 37.7749, longitude: -122.4194)
        locationService.location = expectedLocation

        // When
        let expectation = self.expectation(description: "Request location")
        locationService.requestLocation { result in
            switch result {
            case .success(let location):
                // Then
                XCTAssertEqual(location, expectedLocation)
            case .failure:
                XCTFail("Expected success but got failure")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testRequestLocationFailure() {
        // Given
        let expectedError = NSError(domain: "TestError", code: 0, userInfo: nil)
        locationService.error = expectedError

        // When
        let expectation = self.expectation(description: "Request location")
        locationService.requestLocation { result in
            switch result {
            case .success:
                XCTFail("Expected failure but got success")
            case .failure(let error):
                // Then
                XCTAssertEqual(error as NSError, expectedError)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
