//
//  DarkSkyAPIService.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//

import Foundation
import ForecastIO
import CoreLocation

protocol DarkSkyAPIServiceProtorol {
    func getForecast(for location: CLLocationCoordinate2D, complition: @escaping (Result<Forecast, Error>) -> Void) 
}

class DarkSkyAPIService {
    let apiKey = "01bd9a9eafb3d1d71c307bf67944a47e"
    lazy var darkSkyClient = DarkSkyClient(apiKey: apiKey)
    func getForecast(for location: CLLocationCoordinate2D, complition: @escaping (Result<Forecast, Error>) -> Void) {
        darkSkyClient.getForecast(location: location) { (result) in
            switch result {
            case .success(let forecast, _):
                complition(.success(forecast))
            case .failure(let error):
                complition(.failure(error))
            }
        }
}
