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
        let hours = totalSeconds / 3600
        
        return  hours > 1 ? String(format: "%02d:%02d:%02d", hours, minutes, seconds) : String(format: "%02d:%02d", minutes, seconds)
    }
    
}
