//
//  WeatherVC.swift
//  weather-app
//
//  Created by Martin Nordström on 2017-03-05.
//  Copyright © 2017 Martin Nordström. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
        
        currentWeather.dwnWeatherDetails {
            // Setup UI to load data
            self.dnwForcastData {
                self.updateMainUI()
            }
        }
        
    }
    
    func dnwForcastData(completed: @escaping DownloadComplete) {
        // Downloading the data for the tableview
        let forecast_url = URL(string: forecast_URLL)!
        Alamofire.request(forecast_url).responseJSON { respone in
            let result = respone.result
        
            if let dict = result.value as? Dictionary <String, AnyObject> {
              
                if let list = dict["list"] as? [Dictionary <String, AnyObject>] {
                
                    // Everytime a dictionary is found in an array, the dictionary will be passed into another dictionary (my head hurts).
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                }
                self.forecasts.remove(at: 0)
                self.tableView.reloadData()
            }
        }
        completed()
    }
}
    
    //Required delegate methods for table views
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            let forcast = forecasts[indexPath.row]
            cell.configureCell(forcast: forcast)
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentLocationLabel.text = currentWeather._cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    
}










