//
//  ChatAssembly.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import UIKit

enum ChatAssembly{
    
    // MARK: Static methods
    static func createModule() -> UIViewController {

        let viewController = ChatViewController()
        let router = ChatRouter(view: viewController)
        let darkSkyAPIService = DarkSkyAPIService()
        let recastAIService = RecastAIService()
        let interactor = ChatInteractor(darkSkyAPIService: darkSkyAPIService, recastAIService: recastAIService)
        let presenter = ChatPresenter(view: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter

        return viewController
    }
}
