//
//  PlayerDetailsView.swift
//  PodcastPlayer
//
//  Created by Magnus Holm on 4/17/18.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit
import SDWebImage

class PlayerDetailsView: UIView {
    
    var episode: Episode! {
        didSet {
            episodeTitleLabel.text = episode.title
            episodeAuthorLabel.text = episode.author
            
            guard let url = URL(string: episode.imageUrl ?? "") else { return }
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    @IBAction func dismissButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel! 
    @IBOutlet weak var episodeAuthorLabel: UILabel!
    @IBOutlet weak var episodePlayPauseButton: UIButton!
    
}
