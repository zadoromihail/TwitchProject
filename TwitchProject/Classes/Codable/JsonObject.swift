//
//  JsonObject.swift
//  TwitchProject
//
//  Created by Михаил Задорожный on 28.01.2021.
//

import Foundation

struct JsonObject: Codable {
    
    var _total: Int?
    
    var top: [GameObject]
}
