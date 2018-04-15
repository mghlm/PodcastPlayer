//
//  String.swift
//  PodcastPlayer
//
//  Created by magnus holm on 15/04/2018.
//  Copyright © 2018 magnus holm. All rights reserved.
//

import Foundation

extension String {
    func toSecureHTTPS() -> String {
        return self.contains("https") ? self : self.replacingOccurrences(of: "http", with: "https")
    }
}
