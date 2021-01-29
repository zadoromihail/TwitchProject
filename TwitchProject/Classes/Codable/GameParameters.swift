//
//  GameParameters.swift
//  TwitchProject
//
//  Created by Михаил Задорожный on 28.01.2021.
//

import Foundation

struct GameParameters: Codable {
    
    var name: String?
    
    var _id: Int?
    
    var giantbomb_id: Int?
    
    var box: ImageBox
    
    var localized_name: String?
    
    var locale: String?
}
