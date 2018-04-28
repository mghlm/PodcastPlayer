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
    
    // MARK: - Public properties
    
    let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
    }()
    
    var episode: Episode! {
        didSet {
            episodeTitleLabel.text = episode.title
            episodeAuthorLabel.text = episode.author
            
            playEpisode()
            
            guard let url = URL(string: episode.imageUrl ?? "") else { return }
            episodeImageView.sd_setImage(with: url)
        }
    }
    
    // MARK: - Constants
    
    fileprivate let shrunkenTransform = CGAffineTransform(scaleX: CGFloat(0.7), y: CGFloat(0.7))
    
    // MARK: - UIView
    
    fileprivate func observePlayerCurrentTime() {
        let interval = CMTimeMake(1, 2)
        player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { (time) in
            
            let totalSeconds = Int(CMTimeGetSeconds(time))
            print("Total seconds: \(totalSeconds)")
            
            let seconds = totalSeconds % 60
            let minutes = totalSeconds / 60
            let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
            self.currentTimeLabel.text = timeFormatString
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        observePlayerCurrentTime()
        
        let time = CMTimeMake(1, 3)
        let times = [NSValue(time: time)]
        player.addBoundaryTimeObserver(forTimes: times, queue: .main) {
            self.enlargeImageView()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var episodeImageView: UIImageView! {
        didSet {
            episodeImageView.transform = shrunkenTransform
            episodeImageView.layer.cornerRadius = 8.0
            episodeImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var episodeAuthorLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var durationLabel: UILabel!
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
    
    // MARK: - Private methods
    
    fileprivate func playEpisode() {
        print("Trying to play episode at url:", episode.streamUrl)
        
        guard let url = URL(string: episode.streamUrl) else { return }
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
    }
    
    fileprivate func enlargeImageView() {
        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.episodeImageView.transform = .identity
        })
    }
    
    fileprivate func shrinkImageView() {
        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.episodeImageView.transform = self.shrunkenTransform
        })
    }
    
    @objc fileprivate func handlePlayPause() {
        
        if player.timeControlStatus == .paused {
            player.play()
            playPauseButton.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
            enlargeImageView()
        } else {
            player.pause()
            playPauseButton.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            shrinkImageView()
        }
        
        print("handling play/pause")
    }
    
}
