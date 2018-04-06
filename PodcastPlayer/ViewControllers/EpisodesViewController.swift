//
//  EpisodesViewController.swift
//  PodcastPlayer
//
//  Created by magnus holm on 06/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class EpisodesViewController: UITableViewController {
    
    var episodes = [Episode(title: "An episode"), Episode(title: "Another episide")]
    
    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName ?? "Episodes"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
        return cell
    }
    
}
