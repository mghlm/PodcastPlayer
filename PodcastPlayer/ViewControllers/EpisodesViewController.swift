//
//  EpisodesViewController.swift
//  PodcastPlayer
//
//  Created by magnus holm on 06/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class EpisodesViewController: UITableViewController {
    
//    var episodes = [Episode]()
    
    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName ?? "Episodes"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
}
