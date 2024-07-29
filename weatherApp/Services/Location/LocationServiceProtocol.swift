//
//  LocationServiceProtocol.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import CoreLocation

protocol LocationServiceProtocol {
    func requestLocation(completion: @escaping (Result<CLLocation, Error>) -> Void)
}

