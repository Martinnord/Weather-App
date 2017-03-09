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
    var _weahterType: String!
    var _currentTemp: Double!
    
    // Won't crash
    var ciryName: String {
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
        if _weahterType == nil {
            _weahterType = ""
        }
        return _weahterType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }

    
    
    func dwnWeatherDetails(completed: DownloadComplete) {
        // Alamorefire Download
        let currentWeatherURL = URL(string: current_weather_url)!
        
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            print(response)
        } 
        completed()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}














