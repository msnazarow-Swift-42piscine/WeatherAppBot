//
//  ChatPresenter.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import Foundation
import JSQMessagesViewController

class ChatPresenter: ViewToPresenterChatProtocol {

    // MARK: Properties
    weak var view: PresenterToViewChatProtocol!
    let interactor: PresenterToInteractorChatProtocol
    let router: PresenterToRouterChatProtocol
    let dataSource:PresenterToDataSourceChatProtocol

    // MARK: Init
    init(view: PresenterToViewChatProtocol,
         interactor: PresenterToInteractorChatProtocol,
         router: PresenterToRouterChatProtocol,
         dataSource: PresenterToDataSourceChatProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
    }

    func viewDidLoad(){

    }

    func didPressSend(withMessageText text: String, senderId: String) {
        finishSendingMessage()
        if let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text) {
            messages.append(message)
            self.recastAIBot?.textRequest(text, successHandler: setSuccessResponse, failureHandle: setFailureResponse)
            finishReceivingMessage()
        }
    }
}

extension ChatPresenter: CellToPresenterChatProtocol {
    
}
