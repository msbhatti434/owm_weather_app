//
//  LocationServiceProtocol.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import CoreLocation

protocol LocationServiceProtocol {
    var currentLocation: CLLocation? { get }
    func requestLocation()
}
