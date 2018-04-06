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
    
    @IBOutlet weak var PodcastImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var episodeCountLabel: UILabel!
    
    var podcast: Podcast! {
        didSet {
            trackNameLabel.text = podcast.trackName
            artistNameLabel.text = podcast.artistName
            episodeCountLabel.text = "\(podcast.trackCount ?? 0) Episodes"
        }
    }
    
    
    
}
