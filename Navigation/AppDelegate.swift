//
//  AppDelegate.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainTabBarViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
}

