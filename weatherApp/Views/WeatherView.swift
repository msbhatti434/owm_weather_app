//
//  WeatherView.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            if let latitude = viewModel.latitude, let longitude = viewModel.longitude {
                Text("User's location: \(latitude), \(longitude)")
            } else if let locationError = viewModel.locationError {
                Text("Error: \(locationError)")
            } else {
                Text("Requesting Location...")
            }
        }
        .onAppear {
            viewModel.requestLocation()
        }
    }
}


