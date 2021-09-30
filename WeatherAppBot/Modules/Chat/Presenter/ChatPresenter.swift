//
//  ChatPresenter.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import Foundation
import JSQMessagesViewController
import AVFAudio

class ChatPresenter: ViewToPresenterChatProtocol {

    // MARK: Properties
    weak var view: PresenterToViewChatProtocol!
    let interactor: PresenterToInteractorChatProtocol
    let router: PresenterToRouterChatProtocol

    let senderId: String = "1"
    let senderDisplayName: String = "sgertrud"
    let botDisplayName: String = "School21"
    let botId: String = "2"
    
    var messages: [JSQMessage] = []

    // MARK: Init
    init(view: PresenterToViewChatProtocol,
         interactor: PresenterToInteractorChatProtocol,
         router: PresenterToRouterChatProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad(){
        view.senderId = senderId
        view.senderDisplayName = senderDisplayName
        appendMessage(message: JSQMessage(senderId: botId, displayName: botDisplayName, text: "НАВЭЛЬНЫЙ!"))
    }

    func didPressSend(withMessageText text: String, senderId: String, senderDisplayName: String) {
        view.finishSendingMessage(animated: true)
        guard let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text) else { return }
        appendMessage(message: message)
        addRequest(text: text)
        view.finishReceivingMessage(animated: true)
    }

    func appendMessage(message: JSQMessage){
        self.messages.append(message)
        view.reloaditem(at: IndexPath(item: messages.count - 1, section: 0))
    }

    private func addRequest(text: String) {
        interactor.textRequest(text: text) { [self] result in
            switch result {
            case .success(let location):
                getForecast(for: location)
            case .failure(let error):
                appendMessage(message: JSQMessage(senderId: botId, displayName: botDisplayName, text: (error as? RecastAIClientError)?.localizedDescription ?? "Uknown error"))
            }
        }
    }

    private func getForecast(for location: CLLocationCoordinate2D) {
        interactor.getForecast(for: location) { [self] result in
            switch result {
            case .success(let forecast):
                var text = ""
                if let summary = forecast.daily?.summary {
                    text.append(summary)
                } else if let summary = forecast.hourly?.summary {
                    text.append(summary)
                } else if let summary = forecast.daily?.summary {
                    text.append(summary)
                }
                appendMessage(message: JSQMessage(senderId: botId, displayName: botDisplayName, text: text))
            case .failure(let error):
                appendMessage(message: JSQMessage(senderId: botId, displayName: botDisplayName, text: error.localizedDescription))
            }
        }
    }
}

extension ChatPresenter: CellToPresenterChatProtocol {
    
}
