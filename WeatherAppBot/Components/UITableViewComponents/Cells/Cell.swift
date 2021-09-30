//
//  Cell.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import UIKit

class Cell: UITableViewCell, ModelRepresentable {
    weak var presenter: CellToPresenterChatProtocol!

    var model: Identifiable? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {}
}
