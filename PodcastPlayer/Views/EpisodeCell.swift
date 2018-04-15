//
//  EpisodeCell.swift
//  PodcastPlayer
//
//  Created by magnus holm on 15/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit
import SDWebImage

class EpisodeCell: UITableViewCell {
    
    var episode: Episode! {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            pubDateLabel.text = dateFormatter.string(from: episode.pubDate)
            titleLabel.text = episode.title
            descriptionLabel.text = episode.description
            
            let url = URL(string: episode.imageUrl ?? "")
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    @IBOutlet weak var episodeImageView: UIImageView! {
        didSet {
            episodeImageView.layer.cornerRadius = 8
            episodeImageView.clipsToBounds = true 
        }
    }
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 2
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 2
        }
    }
}

