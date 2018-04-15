//
//  EpisodesViewController.swift
//  PodcastPlayer
//
//  Created by magnus holm on 06/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit
import FeedKit 

class EpisodesViewController: UITableViewController {
    
    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName ?? "Episodes"
            
            fetchEpisodes()
        }
    }
    
    fileprivate func fetchEpisodes() {
        
        guard let feedUrl = podcast?.feedUrl else { return }
        
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        
        guard let url = URL(string: secureFeedUrl) else { return }
        
        let feedParser = FeedParser(URL: url)
        feedParser?.parseAsync(result: { (result) in
            
            switch result {
            case let .rss(feed):
                feed.items?.forEach({ (feedItem) in
                    let episode = Episode(feedItem: feedItem)
                    self.episodes.append(episode)
                })
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                break
            case let .failure(error):
                print("Failed to parse feed", error)
                break
            default:
                print("Found a feed...")
            }
            
        })
    }
    
    var episodes = [Episode]()
    
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
