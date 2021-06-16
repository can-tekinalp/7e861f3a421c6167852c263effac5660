//
//  AppDelegate.swift
//  7e861f3a421c6167852c263effac5660
//
//  Created by CanTekinalp on 12.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    static let shared = UIApplication.shared.delegate as! AppDelegate
    private var navigationController: UINavigationController?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootController()
        return true
    }
    
    private func setupRootController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let hasPlayer = UserDefaults.player != nil
        var controller: UIViewController
        if hasPlayer {
            controller = storyboard.instantiateViewController(withIdentifier: "HomeTabBarController")
            GameManager.shared.loadFromCache()
        } else {
            controller = storyboard.instantiateViewController(withIdentifier: "CreateShipViewController")
        }
        
        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func routeToHomePage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "HomeTabBarController")
        self.navigationController?.setViewControllers([controller], animated: true)
    }
}

