//
//  APIService.swift
//  PodcastPlayer
//
//  Created by magnus holm on 03/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    let baseiTunesSearchURL = "https://itunes.apple.com/search"
    
    static let shared = APIService()
    
    func fetchPodcast(searchText: String, completion: @escaping ([Podcast]) -> () ) {
        
        let parameters = ["term": searchText,
                          "media": "podcast"]
        
        Alamofire.request(baseiTunesSearchURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .response { (dataResponse) in
                
                if let error = dataResponse.error {
                    print("failed to load", error)
                    return
                }
                
                guard let data = dataResponse.data else {
                    return
                }
                
                do {
                    let searchResult = try JSONDecoder().decode(SearchResults.self, from: data)
                    completion(searchResult.results)
                                        
                } catch let decodeError {
                    print("Failed to decode:", decodeError)
                }
        }
 
    }
    
}

struct SearchResults: Decodable {
    let resultCount: Int
    let results: [Podcast]
}
