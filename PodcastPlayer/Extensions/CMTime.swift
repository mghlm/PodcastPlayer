//
//  CMTime.swift
//  PodcastPlayer
//
//  Created by Magnus Holm on 5/10/18.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let seconds = totalSeconds % 60
        let minutes = totalSeconds / 60
        
        return  String(format: "%02d:%02d", minutes, seconds)
    }
    
}
