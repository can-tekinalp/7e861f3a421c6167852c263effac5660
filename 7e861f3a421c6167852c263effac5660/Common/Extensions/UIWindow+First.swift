//
//  UIWindow+First.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 14.06.2021.
//

import UIKit

extension UIWindow {
    
    static var first: UIWindow? {
        return UIApplication.shared.windows.filter { $0.isKeyWindow }.first
    }
}
