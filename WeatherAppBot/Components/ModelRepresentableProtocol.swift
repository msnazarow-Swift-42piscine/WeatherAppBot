//
//  ModelRepresentableProtocol.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import Foundation

protocol ModelRepresentable {
    var model: Identifiable? { get set }
}

protocol Identifiable {
    var identifier: String { get }
}
