//
//  ChatViewController.swift
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

class ChatViewController: JSQMessagesViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterChatProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = presenter.dataSource
        setupUI()
        presenter?.viewDidLoad()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {

    }

    private func setupConstraints() {

    }
}

extension ChatViewController {

}


extension ChatViewController: PresenterToViewChatProtocol{
    
}
