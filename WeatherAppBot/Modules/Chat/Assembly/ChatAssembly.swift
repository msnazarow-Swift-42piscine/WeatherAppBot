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
        let interactor = ChatInteractor()
        let dataSource = ChatPresenterDataSource()
        let presenter = ChatPresenter(view: viewController, interactor: interactor, router: router, dataSource: dataSource)

        viewController.presenter = presenter
        dataSource.presenter = presenter

        return viewController
    }
}
