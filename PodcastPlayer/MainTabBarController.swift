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
        
        let favoritesViewController = ViewController()
        favoritesViewController.tabBarItem.title = "Favourites"
        favoritesViewController.tabBarItem.image = #imageLiteral(resourceName: "favorites")
        
        let searchNavigationController = UINavigationController(rootViewController: ViewController())
        searchNavigationController.tabBarItem.title = "Search"
        searchNavigationController.tabBarItem.image = #imageLiteral(resourceName: "search")
        
        viewControllers = [favoritesViewController, searchNavigationController]
    }
}
