//
//  GameListViewModel.swift
//  TwitchProject
//
//  Created by Михаил Задорожный on 28.01.2021.
//

import Foundation
import UIKit
import Alamofire

class GameListViewModel {
    
    private let clientID = "68jg1mllysz0xnlc5zx9j5djmm0ldn"
    private let urlString = "https://api.twitch.tv/kraken/games/top?limit=100"
    
    private var gameObjects: [GameObject] = []
    private var gameInfo: [GameInfo] = []
    
    var numberOfRowsInSection: Int {
        gameInfo.count
    }
    
    func game(at index: Int) -> GameInfo? {
        guard gameInfo.indices.contains(index) else { return nil}
        return gameInfo[index]
    }
    
    lazy var headers: HTTPHeaders = [
        "Accept": "application/vnd.twitchtv.v5+json",
        "Client-ID": clientID
    ]
    
    func getInfo(completion: @escaping() -> () ) {
        AF.request(urlString, method: .get, headers: headers).response { [weak self] response in
            guard
                let self = self,
                let data = response.data,
                let games = try? JSONDecoder().decode(JsonObject.self, from: data) else {
                print("Error \(String(describing: response.error?.localizedDescription))")
                return
            }
            
            self.gameObjects = games.top
            self.mapJson()
            
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    private func mapJson() {
        gameObjects.forEach { game in
            let gameInfoObject = GameInfo(
                nameOfTheGame: game.game.name,
                numberOfViewers: game.viewers,
                numberOfChannels: game.channels,  
                gameCover: game.game.box.medium)
            gameInfo.append(gameInfoObject)
        }
    }
}
