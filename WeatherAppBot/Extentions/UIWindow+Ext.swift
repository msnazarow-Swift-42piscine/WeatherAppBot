//
//  UIWindow+Ext.swift
//  WeatherAppBot
//
//  Created by out-nazarov2-ms on 30.09.2021.
//  
//

import UIKit

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
