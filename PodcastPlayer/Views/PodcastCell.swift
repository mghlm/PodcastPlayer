//
//  PodcastCell.swift
//  PodcastPlayer
//
//  Created by magnus holm on 03/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class PodcastCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var podcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"
            
            print("Loading podcast image with url: \(podcast.artworkUrl600 ?? "")")
            
            guard let url = URL(string: podcast.artworkUrl600 ?? "") else { return }
            
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.podcastImageView.image = UIImage(data: data)
                }
                
            }.resume()
            
        }
    }
    
    
    
}
