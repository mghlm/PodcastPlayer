//
//  RSSFeed.swift
//  PodcastPlayer
//
//  Created by magnus holm on 15/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import FeedKit

extension RSSFeed {
    
    func toEpisodes() -> [Episode] {
        
        var episodeArray = [Episode]()
        let imageUrl = iTunes?.iTunesImage?.attributes?.href
        
        items?.forEach({ (feedItem) in
            var episode = Episode(feedItem: feedItem)
            
            if episode.imageUrl == nil {
                episode.imageUrl = imageUrl
            }
            
            episodeArray.append(episode)
        })
        
        return episodeArray
    }
}
