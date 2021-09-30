//
//  ChatContract.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import UIKit
import JSQMessagesViewController
import ForecastIO
import RecastAI
import CoreLocation

// MARK: View Output (Presenter -> View)
protocol PresenterToViewChatProtocol: AnyObject {
    func finishSendingMessage(animated: Bool)
    func finishReceivingMessage(animated: Bool)
    var senderId: String! { get set }
    var senderDisplayName: String! { get set }
    func reloaditem(at intexPath: IndexPath)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterChatProtocol: AnyObject {
    var messages: [JSQMessage] { get }
    var senderId: String { get }
    var senderDisplayName: String { get }
    func viewDidLoad()
    func didPressSend(withMessageText text: String, senderId: String, senderDisplayName: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorChatProtocol: AnyObject {

    func getForecast(for location: CLLocationCoordinate2D, complition: @escaping (Result<Forecast, Error>) -> Void)
    func textRequest(text: String, complition: @escaping (Result<CLLocationCoordinate2D, Error>) -> Void)
}

// MARK: Presenter Output (Presenter -> Router)
protocol PresenterToRouterChatProtocol: AnyObject {
    
}

// MARK: Presenter Output (Presenter -> DataSource)
protocol PresenterToDataSourceChatProtocol: JSQMessagesCollectionViewDataSource, JSQMessagesCollectionViewDelegateFlowLayout, UITextViewDelegate {
    func appendMessage(message: JSQMessage)
}

// MARK: Cell Input (Cell -> Presenter)
protocol CellToPresenterChatProtocol: AnyObject {

}
