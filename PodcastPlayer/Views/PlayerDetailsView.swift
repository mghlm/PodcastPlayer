//
//  PlayerDetailsView.swift
//  PodcastPlayer
//
//  Created by Magnus Holm on 4/17/18.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit
import AVKit
import SDWebImage

class PlayerDetailsView: UIView {
    
    var episode: Episode! {
        didSet {
            episodeTitleLabel.text = episode.title
            episodeAuthorLabel.text = episode.author
            
            playEpisode()
            
            guard let url = URL(string: episode.imageUrl ?? "") else { return }
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    fileprivate func playEpisode() {
        print("Trying to play episode at url:", episode.streamUrl)
        
        guard let url = URL(string: episode.streamUrl) else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    // MARK: - Actions
    
    @IBAction func dismissButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    @IBOutlet weak var playPauseButton: UIButton! {
        didSet {
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            playPauseButton.addTarget(self, action: #selector(handlePlayPause), for: .touchUpInside)
        }
    }
    
    
    @objc fileprivate func handlePlayPause() {
        
        if player.timeControlStatus == .paused {
            player.play()
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        } else {
            player.pause()
            playPauseButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
        }
        
        print("handling play/pause")
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel! 
    @IBOutlet weak var episodeAuthorLabel: UILabel!
    
}
