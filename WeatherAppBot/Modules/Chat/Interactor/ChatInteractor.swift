//
//  ChatInteractor.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import JSQMessagesViewController
import ForecastIO
import RecastAI
import CoreLocation

class ChatInteractor: PresenterToInteractorChatProtocol {
    let darkSkyAPIService: DarkSkyAPIServiceProtorol
    let recastAIService: RecastAIServiceProtocol
    init(darkSkyAPIService: DarkSkyAPIServiceProtorol, recastAIService: RecastAIServiceProtocol) {
        self.darkSkyAPIService = darkSkyAPIService
        self.recastAIService = recastAIService
    }

    func getForecast(for location: CLLocationCoordinate2D, complition: @escaping (Result<Forecast, Error>) -> Void) {
        darkSkyAPIService.getForecast(for: location, complition: complition)
    }

    func textRequest(text: String, complition: @escaping (Result<CLLocationCoordinate2D, Error>) -> Void) {
        recastAIService.textRequest(text: text, complition: complition)
    }
}
