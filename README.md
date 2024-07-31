#  Weather App
## Overview
This Weather App provides current weather conditions and a 5-day forecast based on the user's location. The app leverages the OpenWeatherMap API to fetch weather data and displays it in a user-friendly interface.

## Features:

Current Weather: Displays the current temperature, weather conditions, and additional details like UV index, humidity, and rain percentage.
5-Day Forecast: Shows a 5-day weather forecast with daily temperature and weather conditions.
Location Tracking: Retrieves and displays weather data based on the user's current location.
    
    


## Requirements
- iOS 14.0 or later
- Swift 5.5 or later
- Xcode 13.0 or later

## Installation

1. Clone the repository:

git clone https://github.com/msbhatti434/owm_weather_app.git
    
2. Open the project in Xcode:

    cd weatherApp
    
    open weatherApp.xcodeproj
    
3. API Key Setup 

    3.1 Get your NY Times API key from [OpenWeather APIs](https://openweathermap.org/appid).
    
    3.2 Create a `Secrets.plist` file in the project directory and add your API key:
    
    xml
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
            <dict>
                <key>OWM_API_KEY</key>
                <string>your-api-key-here</string>
            </dict>
        </plist>

4. Running the App

    Build and run the project in Xcode.
    
5. Unit Testing

    To run unit tests, open the project in Xcode and select Product > Test or press Cmd+U. The project includes tests for key components such as data retrieval, parsing, and UI rendering.


## Acknowledgements
OpenWeatherMap API for providing weather data.
SwiftUI for modern UI development.
