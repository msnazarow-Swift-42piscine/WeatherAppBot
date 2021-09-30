//
//  RecastAIService.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//

import Foundation
import RecastAI
import CoreLocation
import UIKit

protocol RecastAIServiceProtocol {
    func textRequest(text: String, complition: @escaping (Result<CLLocationCoordinate2D, Error>) -> Void)
}

enum RecastAIClientError: Error {
    case noLocation

    var localizedDescription: String {
        switch self {
        case .noLocation:
            return "Write city to me and i give your forecast"
        }
    }
}

class RecastAIService: RecastAIServiceProtocol {
    let token = "cad015d393a344ae67395b3055ab91c4"
    var complition: ((Result<CLLocationCoordinate2D, Error>) -> Void)!
    lazy var recastAIClient = RecastAIClient(token: token, language: "en")

    func textRequest(text: String, complition: @escaping (Result<CLLocationCoordinate2D, Error>) -> Void) {
        self.complition = complition
        recastAIClient.textRequest(text, successHandler: succesHandler, failureHandle: failureHandle)
    }

    func succesHandler(_ response: Response) {
        if let location = response.get(entity: "location") {
            if let lat = location["lat"] as? CLLocationDegrees, let lng = location["lng"] as? CLLocationDegrees {
                let myLoc = CLLocationCoordinate2D(latitude: lat, longitude: lng)
                complition(.success(myLoc))
            }
        }
        else {
            complition(.failure(RecastAIClientError.noLocation))
        }
    }

    func failureHandle(_ error: Error) {
        complition(.failure(error))
    }
}
