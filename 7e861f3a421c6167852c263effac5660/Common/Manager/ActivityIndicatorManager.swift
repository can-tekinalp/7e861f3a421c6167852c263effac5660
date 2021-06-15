//
//  ActivityIndicatorManager.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 14.06.2021.
//

import UIKit

final class ActivityIndicatorManager {
    
    static let shared = ActivityIndicatorManager()
    
    private let indicator: UIActivityIndicatorView = {
        var activity = UIActivityIndicatorView()
        if #available(iOS 13, *) {
            activity = UIActivityIndicatorView(style: .large)
        }
        return activity
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.addSubview(indicator)
        indicator.anchorCenterSuperview()
        return view
    }()
    
    private var isActive = false
    
    private init() { }
    
    func show() {
        DispatchQueue.main.async {
            if self.isActive == false {
                self.isActive = true
                UIWindow.first?.addSubview(self.containerView)
                self.containerView.fillSuperView()
                self.indicator.startAnimating()
            }
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            if self.isActive == true {
                self.isActive = false
                self.indicator.stopAnimating()
                self.containerView.removeFromSuperview()
            }
        }
    }
}
