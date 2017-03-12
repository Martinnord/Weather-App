//
//  WeatherCell.swift
//  weather-app
//
//  Created by Martin Nordström on 2017-03-12.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit
import Alamofire

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var hightTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    
    func configureCell(forcast: Forecast) {
        dayLabel.text = forcast.date
        weatherType.text = "\(forcast.weatherType)"
        weatherIcon.image = UIImage(named: forcast.weatherType)
        hightTemp.text = "\(forcast.highTemp)"
        lowTemp.text = "\(forcast.lowTemp)"
    }
    

}
