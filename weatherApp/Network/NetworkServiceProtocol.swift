//
//  NetworkServiceProtocol.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(url: URL, method: HTTPMethod) async throws -> T
}

