//
//  ChatInteractor.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import Foundation

class ChatInteractor: PresenterToInteractorChatProtocol {
    let darkSlyAPIService: DarkSkyAPIServiceProtorol

    init(darkSlyAPIService: DarkSkyAPIServiceProtorol) {
        self.darkSlyAPIService = darkSlyAPIService
    }

    func getForecast(for location: CLLocationCoordinate2D, complition: @escaping (Result<Forecast, Error>) -> Void) {
        darkSlyAPIService.getForecast(for: location, complition: complition)
    }
   
}
