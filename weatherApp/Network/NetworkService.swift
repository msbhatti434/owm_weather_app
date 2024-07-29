//
//  NetworkService.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

struct NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(url: URL, method: HTTPMethod = .get) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw NetworkError.invalidResponse
            }
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            if let decodingError = error as? DecodingError {
                throw NetworkError.decodingFailed(decodingError)
            } else {
                throw NetworkError.requestFailed(error)
            }
        }
    }
}
