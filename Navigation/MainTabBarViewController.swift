//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    private let feedVC = FeedViewController()
    private let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConrollers()
    }
    
    private func setupConrollers() {
        let feedNavigationController = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "Лента пользователя"
        feedVC.tabBarItem.image = UIImage(systemName: "person.crop.rectangle.stack")
        
        let profileNavigationController = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person")
//        profileNavigationController.navigationBar.isTranslucent = false
//        profileNavigationController.navigationBar.backgroundColor = .white
          
        viewControllers = [feedNavigationController, profileNavigationController]
        }
    }
