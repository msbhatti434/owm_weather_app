//
//  NetworkError.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
}
