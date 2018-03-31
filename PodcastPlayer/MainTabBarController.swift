//
//  MainTabBarController.swift
//  PodcastPlayer
//
//  Created by magnus holm on 31/03/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple
        
        setupViewControllers()
    }
    
    // MARK: - Setup Functions
    
    fileprivate func setupViewControllers() {
        let favoritesNavigationController = generateNavigationController(with: ViewController(), title: "Favorites", image: #imageLiteral(resourceName: "favorites"))
        let searchNavigationController = generateNavigationController(with: ViewController(), title: "Search", image: #imageLiteral(resourceName: "search"))
        let downloadsNavigationController = generateNavigationController(with: ViewController(), title: "Downloads", image: #imageLiteral(resourceName: "downloads"))
        
        viewControllers = [favoritesNavigationController, searchNavigationController, downloadsNavigationController]
    }
    
    // MARK: - Helper functions
    
    fileprivate func generateNavigationController(with rootViewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        rootViewController.navigationItem.title = title
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        
        return navigationController
    }
}
