//
//  LocationError.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

enum LocationError: Error {
    case permissionDenied
    case locationServicesDisabled
    case locationNotFound
}
