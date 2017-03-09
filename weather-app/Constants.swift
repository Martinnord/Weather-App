//
//  Constants.swift
//  weather-app
//
//  Created by Martin Nordström on 2017-03-08.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import Foundation

let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
let lat = "lat="
let long = "&lon="
let appID = "&appid="
let APIKey = "d8f274c2281319a7eeca5d5f847a53f8"

// Creating an exsiting type
typealias DownloadComplete = () -> ()

let current_weather_url = "\(baseUrl)\(lat)59.334591\(long)18.063240\(appID)\(APIKey)"
