//
//  weatherAppApp.swift
//  weatherApp
//
//  Created by Saqlain Bhatti on 29/07/2024.
//

import SwiftUI

@main
struct weatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                // Use the AppConfigurator to get the view model
                WeatherView(viewModel: AppConfigurator.configure())
            }
        }
    }
}
