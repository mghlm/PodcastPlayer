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
        
        tabBar.tintColor = .purple
        
        let favoritesNavigationController = UINavigationController(rootViewController: ViewController())
        favoritesNavigationController.tabBarItem.title = "Favourites"
        favoritesNavigationController.tabBarItem.image = #imageLiteral(resourceName: "favorites")
        
        let searchNavigationController = UINavigationController(rootViewController: ViewController())
        searchNavigationController.tabBarItem.title = "Search"
        searchNavigationController.tabBarItem.image = #imageLiteral(resourceName: "search")
        
        let downloadsNavigationController = UINavigationController(rootViewController: ViewController())
        downloadsNavigationController.tabBarItem.title = "Downloads"
        downloadsNavigationController.tabBarItem.image = #imageLiteral(resourceName: "downloads")
        
        viewControllers = [favoritesNavigationController, searchNavigationController, downloadsNavigationController]
    }
}
