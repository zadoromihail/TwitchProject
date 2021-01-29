//
//  GameObject.swift
//  TwitchProject
//
//  Created by Михаил Задорожный on 28.01.2021.
//

import Foundation

struct GameObject: Codable {
    
    var game: GameParameters
    
    var viewers: Int?
    
    var channels: Int?
}
