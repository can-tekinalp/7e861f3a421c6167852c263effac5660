//
//  UIViewController+Alert.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 13.06.2021.
//

import UIKit

typealias ActionHandler = (UIAlertAction) -> Void

extension UIViewController {
    
    @discardableResult func showOkAlert(title: String?, message: String, handler: ActionHandler? = nil) -> UIAlertController {
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: handler)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(okAction)
        presentAlert(alertController)
        return alertController
    }
    
    @discardableResult func showAlertWithButtons(title: String?, message: String, okTitle: String, okHandler: ActionHandler?, cancelTitle: String, cancelHandler: ActionHandler?) -> UIAlertController {
        let okAction = UIAlertAction(title: okTitle, style: .default, handler: okHandler)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .default, handler: cancelHandler)
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        presentAlert(alertController)
        return alertController
    }
    
    private func presentAlert(_ alertController: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
