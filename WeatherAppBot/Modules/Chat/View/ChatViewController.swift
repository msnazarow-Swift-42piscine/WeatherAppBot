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
import SnapKit

class ChatViewController: JSQMessagesViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterChatProtocol!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    private func setupUI() {
        inputToolbar.contentView.leftBarButtonItem = nil
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
    }



    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        presenter.didPressSend(withMessageText: text, senderId: senderId, senderDisplayName: senderDisplayName)
    }

    func reloaditem(at intexPath: IndexPath) {
        DispatchQueue.main.async {
            self.finishSendingMessage(animated: true)
            self.finishReceivingMessage(animated: true)
//            self.collectionView.reloadItems(at: [intexPath])
        }
    }
}

extension ChatViewController {

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return presenter.messages[indexPath.item]
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.messages.count
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        return presenter.messages[indexPath.item].senderId == presenter.senderId ?
        JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleGreen()) :
        JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.jsq_messageBubbleRed())
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        return presenter.messages[indexPath.item].senderId == presenter.senderId ? nil : NSAttributedString(string: presenter.messages[indexPath.item].senderDisplayName)
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return presenter.messages[indexPath.item].senderId == presenter.senderId ? 0 : 15
    }

}


extension ChatViewController: PresenterToViewChatProtocol{

}
