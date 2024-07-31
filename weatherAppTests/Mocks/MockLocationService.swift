//
//  MockLocationService.swift
//  weatherAppTests
//
//  Created by Saqlain Bhatti on 01/08/2024.
//

import Foundation
import CoreLocation

class MockLocationService: LocationServiceProtocol {
    var location: CLLocation?
    var error: Error?

    func requestLocation(completion: @escaping (Result<CLLocation, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else if let location = location {
            completion(.success(location))
        }
    }
}
