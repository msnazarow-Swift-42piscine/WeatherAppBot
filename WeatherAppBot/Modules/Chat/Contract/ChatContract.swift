//
//  ChatContract.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import UIKit
import JSQMessagesViewController

// MARK: View Output (Presenter -> View)
protocol PresenterToViewChatProtocol: AnyObject {

}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterChatProtocol: AnyObject {
    var dataSource:PresenterToDataSourceChatProtocol { get }
    func viewDidLoad()
    func didPressSend(withMessageText text: String, senderId: String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorChatProtocol: AnyObject {
    func getForecast(for location: CLLocationCoordinate2D, complition: @escaping (Result<Forecast, Error>) -> Void) 
}

// MARK: Presenter Output (Presenter -> Router)
protocol PresenterToRouterChatProtocol: AnyObject {
    
}

// MARK: Presenter Output (Presenter -> DataSource)
protocol PresenterToDataSourceChatProtocol: JSQMessagesCollectionViewDataSource {
    func updateForSections(_ sections: [SectionModel])
}

// MARK: Cell Input (Cell -> Presenter)
protocol CellToPresenterChatProtocol: AnyObject {

}
