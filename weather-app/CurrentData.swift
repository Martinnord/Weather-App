//
//  CurrentData.swift
//  weather-app
//
//  Created by Martin Nordström on 2017-03-09.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {

    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    // Won't crash
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long // Will return the full name of the month, the day and the year
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date()) // Transform the date into a string
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
           _currentTemp = 0.0
        }
        return _currentTemp
    }

    
    
    func dwnWeatherDetails(completed: @escaping DownloadComplete) {
        // Alamorefire Download        
        Alamofire.request(current_weather_url).responseJSON { response in
            let result = response.result
            print(response)
            if let dict = result.value as? Dictionary<String, AnyObject> { // What's inside will be casts as strings
               
                // City name
                if let name = dict["name"] as? String  {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                // Weather type
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }
                
                // Current temp
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let temp = main["temp"] as? Double {
                        
                        let kelvinToCelsius = temp - 273.15

                        self._currentTemp = kelvinToCelsius.roundTo(places: 2)
                        
                    }
                }
                completed()
            }

        }
    }
}














