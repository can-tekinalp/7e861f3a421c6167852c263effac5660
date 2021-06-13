//
//  UIView+TapGesture.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

extension UIView {
    
    func addTapGesture(target: Any?, action: Selector?) {
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        addGestureRecognizer(tapGesture)
    }
}
