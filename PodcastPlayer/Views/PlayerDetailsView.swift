//
//  PlayerDetailsView.swift
//  PodcastPlayer
//
//  Created by Magnus Holm on 4/17/18.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import UIKit

class PlayerDetailsView: UIView {
    
    @IBAction func dismissButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var episodeTitleLabel: UILabel!
    
}
