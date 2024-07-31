//
//  WeatherDetailView.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 31/07/2024.
//

import SwiftUI

struct WeatherDetailView: View {
    let label: String
    let value: String

    var body: some View {
        VStack {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.headline)
        }
    }
}
