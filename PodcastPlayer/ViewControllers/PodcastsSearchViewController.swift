//
//  PodcastsSearchViewController.swift
//  PodcastPlayer
//
//  Created by magnus holm on 31/03/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit
import Alamofire

class PodcastsSearchViewController: UITableViewController, UISearchBarDelegate {
    
    var podcasts = [Podcast]()
    
    let cellId = "cellId"
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    // MARK: - Setup
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    // MARK: UISearchController
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let url = "https://itunes.apple.com/search?term=\(searchText)"
        Alamofire.request(url).response { (dataResponse) in
            if let error = dataResponse.error {
                print("failed to load", error)
                return
            }
            
            guard let data = dataResponse.data else {
                return
            }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                searchResult.results.forEach({ (podcast) in
                    print(podcast.artistName, podcast.trackName)
                })
                
                self.podcasts = searchResult.results
                self.tableView.reloadData()
                
            } catch let decodeError {
                print("Failed to decode:", decodeError)
            }
        }
    }
    
    struct SearchResults: Decodable {
        let resultCount: Int
        let results: [Podcast]
    }
    
    // MARK: - UITableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        
        cell.textLabel?.text = "\(podcast.trackName)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = 0
        cell.imageView?.image = #imageLiteral(resourceName: "appicon")
        return cell
    }
    
}
