//
//  PodcastsSearchViewController.swift
//  PodcastPlayer
//
//  Created by magnus holm on 31/03/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class PodcastsSearchViewController: UITableViewController {
    
    let podcasts = [
        Podcast(name: "A podcast", artistName: "Magnus"),
        Podcast(name: "Another podcast", artistName: "Magnus1"),
        Podcast(name: "A third podcast", artistName: "Magnus2")
    ]
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        return cell
    }
    
}
