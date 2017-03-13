//
//  Location.swift
//  weather-app
//
//  Created by Martin Nordström on 2017-03-12.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import CoreLocation

class Location {
    // Static var: Will be accessable in the entire app. Global var
    static var sharedInstance = Location()
    
    private init() {}

    // Lon and Lan
    var longitude: Double!
    var latitude: Double!
    
    
}

