//
//  ChatRouter.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import UIKit

class ChatRouter: PresenterToRouterChatProtocol {

    // MARK: - Properties
    weak var view: UIViewController!

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }
    
}
