//
//  BaseViewController.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGesture()
    }
    
    private func addTapGesture() {
        view.addTapGesture(target: self, action: #selector(handleTap(_:)))
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
}
