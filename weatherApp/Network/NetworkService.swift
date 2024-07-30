//
//  NetworkService.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import Foundation

//struct NetworkService: NetworkServiceProtocol {
//    func request<T: Decodable>(url: URL, method: HTTPMethod = .get) async throws -> T {
//        var request = URLRequest(url: url)
//        request.httpMethod = method.rawValue
//        
//        do {
//            let (data, response) = try await URLSession.shared.data(for: request)
//            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
//                throw NetworkError.invalidResponse
//            }
//            let decodedData = try JSONDecoder().decode(T.self, from: data)
//            return decodedData
//        } catch {
//            if let decodingError = error as? DecodingError {
//                throw NetworkError.decodingFailed(decodingError)
//            } else {
//                throw NetworkError.requestFailed(error)
//            }
//        }
//    }
//}


final class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(url: URL, method: HTTPMethod) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        logRequest(request)

        let (data, response) = try await URLSession.shared.data(for: request)
        
        logResponse(data: data, response: response)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }

    private func logRequest(_ request: URLRequest) {
        print("Request URL: \(request.url?.absoluteString ?? "N/A")")
        print("Request Method: \(request.httpMethod ?? "N/A")")
        if let headers = request.allHTTPHeaderFields {
            print("Request Headers: \(headers)")
        }
        if let body = request.httpBody {
            print("Request Body: \(String(data: body, encoding: .utf8) ?? "N/A")")
        }
    }

    private func logResponse(data: Data, response: URLResponse) {
        if let httpResponse = response as? HTTPURLResponse {
            print("Response Status Code: \(httpResponse.statusCode)")
            print("Response Headers: \(httpResponse.allHeaderFields)")
        }
        print("Response Body: \(String(data: data, encoding: .utf8) ?? "N/A")")
    }
}
