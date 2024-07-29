#  WeatherApp
## Description
A simple app to fetch and display current weather conditions for a user's location and a 5-day forecast from Open Weather MAp API's'.
### NOTE:-
    primarily design is inspired from the figma design file : https://www.figma.com/community/file/1019097765306863573
    
    


## Requirements
- Xcode 12+
- iOS 15+
- Swift 5+

## Installation

1. Clone the repository:

    git clone  https://github.com/msbhatti434/owm_weather_app.git
    
2. Open the project in Xcode:

    cd weatherApp
    
    open weatherApp.xcodeproj
    
3. API Key

## API Key Setup
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

