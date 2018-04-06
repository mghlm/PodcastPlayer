//
//  EpisodesViewController.swift
//  PodcastPlayer
//
//  Created by magnus holm on 06/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class EpisodesViewController: UITableViewController {
    
    var episodes = [Episode(title: "An episode"), Episode(title: "Another episode"), Episode(title: "A third episode")]
    
    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName ?? "Episodes"
        }
    }
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    // MARK: - Setup
    
    fileprivate func setupTableView() {
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let episode = episodes[indexPath.row]
        cell.textLabel?.text = episode.title
        return cell
    }
    
    
    
}
