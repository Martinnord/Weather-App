//
//  Constants.swift
//  weather-app
//
//  Created by Martin Nordström on 2017-03-08.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import Foundation

// Creating an exsiting type
typealias DownloadComplete = () -> ()

let current_weather_url = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=d8f274c2281319a7eeca5d5f847a53f8"

let forecast_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&appid=d8f274c2281319a7eeca5d5f847a53f8"
